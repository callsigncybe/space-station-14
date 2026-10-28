#:package YamlDotNet@16.3.0

// Herramienta de traducción de nombres de entidades para [ES][MRP] Argentea Station.
//
//   dotnet run Tools/argentea/EntLoc/EntLoc.cs -- extract <repo> <salida>
//     Lee Resources/Prototypes, resuelve name/description/suffix por herencia y escribe
//     <salida>/entities.tsv (id, archivo, índices de texto) y <salida>/strings.tsv (textos únicos).
//
//   dotnet run Tools/argentea/EntLoc/EntLoc.cs -- build <repo> <salida>
//     Genera Resources/Locale/es-419/_prototypes/<ruta del yml>.ftl con entradas ent-<ID>, usando la
//     memoria de traducción Tools/argentea/EntLoc/traducciones.tsv (tipo<TAB>inglés<TAB>español).
//     Si existe <salida>/strings.es.tsv (índice<TAB>traducción, índices de strings.tsv), primero
//     agrega esas traducciones a la memoria. Los textos sin traducción quedan en <salida>/faltantes.tsv,
//     con el mismo formato que strings.tsv, listos para traducir.
//
// Después de actualizar Starlight: extract, traducir faltantes.tsv -> strings.es.tsv, build.

using System.Text;
using YamlDotNet.RepresentationModel;

if (args.Length != 3 || (args[0] != "extract" && args[0] != "build"))
{
    Console.Error.WriteLine("Uso: EntLoc.cs extract|build <repo> <salida>");
    return 1;
}

var repo = Path.GetFullPath(args[1]);
var outDir = Path.GetFullPath(args[2]);
var protoDir = Path.Combine(repo, "Resources", "Prototypes");
var utf8 = new UTF8Encoding(false);

if (args[0] == "extract")
{
    var protos = new Dictionary<string, Proto>();
    var partials = new List<(Proto Patch, bool HasParent)>();
    var dupes = 0;
    foreach (var file in Directory.EnumerateFiles(protoDir, "*.yml", SearchOption.AllDirectories))
    {
        var stream = new YamlStream();
        try
        {
            using var reader = new StreamReader(file);
            stream.Load(reader);
        }
        catch (Exception e)
        {
            Console.Error.WriteLine($"No se pudo leer {file}: {e.Message}");
            continue;
        }

        foreach (var doc in stream.Documents)
        {
            if (doc.RootNode is not YamlSequenceNode seq)
                continue;

            foreach (var node in seq.Children.OfType<YamlMappingNode>())
            {
                if (Child(node, "type") is not YamlScalarNode { Value: "entity" } typeNode)
                    continue;

                // Starlight: "!PartialOnly entity" modifica una entidad existente.
                var partial = !typeNode.Tag.IsEmpty && !typeNode.Tag.IsNonSpecific && typeNode.Tag.Value == "!PartialOnly";

                // "id: !type:CreateVariants" genera una entidad por cada valor de la lista.
                var ids = Child(node, "id") switch
                {
                    YamlScalarNode s when s.Value != null => [s.Value],
                    YamlMappingNode m => VariantValues(m) ?? [],
                    _ => new List<string>(),
                };

                for (var i = 0; i < ids.Count; i++)
                {
                    var parentNode = Child(node, "parent");
                    var proto = new Proto(
                        ids[i],
                        Path.GetRelativePath(protoDir, file).Replace('\\', '/'),
                        Parents(parentNode, i),
                        Field(node, "abstract", i) == "true",
                        Field(node, "name", i),
                        Field(node, "description", i),
                        Field(node, "suffix", i));

                    if (partial)
                    {
                        partials.Add((proto, parentNode != null));
                        continue;
                    }

                    if (protos.ContainsKey(ids[i]))
                        dupes++;
                    protos[ids[i]] = proto;
                }
            }
        }
    }

    var patched = 0;
    foreach (var (patch, hasParent) in partials)
    {
        if (!protos.TryGetValue(patch.Id, out var baseProto))
            continue;
        protos[patch.Id] = baseProto with
        {
            Parents = hasParent ? patch.Parents : baseProto.Parents,
            Name = patch.Name ?? baseProto.Name,
            Desc = patch.Desc ?? baseProto.Desc,
            Suffix = patch.Suffix ?? baseProto.Suffix,
        };
        patched++;
    }

    string? Resolve(string id, Func<Proto, string?> field, HashSet<string> seen)
    {
        if (!seen.Add(id) || !protos.TryGetValue(id, out var proto))
            return null;
        if (field(proto) is { } own)
            return own;
        foreach (var parent in proto.Parents)
        {
            if (Resolve(parent, field, seen) is { } inherited)
                return inherited;
        }
        return null;
    }

    var strings = new Dictionary<string, int>();
    var stringList = new List<(string Kind, string Text)>();
    int Index(string kind, string? text)
    {
        if (string.IsNullOrWhiteSpace(text))
            return -1;
        text = Normalize(text);
        var key = kind + "\u0001" + text;
        if (!strings.TryGetValue(key, out var idx))
        {
            idx = stringList.Count;
            strings[key] = idx;
            stringList.Add((kind, text));
        }
        return idx;
    }

    Directory.CreateDirectory(outDir);
    var entities = new StringBuilder("id\tfile\tname\tdesc\tsuffix\n");
    var count = 0;
    foreach (var proto in protos.Values.Where(p => !p.Abstract).OrderBy(p => p.File).ThenBy(p => p.Id, StringComparer.Ordinal))
    {
        var name = Index("name", Resolve(proto.Id, p => p.Name, new()));
        var desc = Index("desc", Resolve(proto.Id, p => p.Desc, new()));
        var suffix = Index("suffix", Resolve(proto.Id, p => p.Suffix, new()));
        if (name < 0 && desc < 0 && suffix < 0)
            continue;
        entities.Append($"{proto.Id}\t{proto.File}\t{name}\t{desc}\t{suffix}\n");
        count++;
    }

    var sb = new StringBuilder("index\tkind\ttext\n");
    for (var i = 0; i < stringList.Count; i++)
        sb.Append($"{i}\t{stringList[i].Kind}\t{stringList[i].Text}\n");

    File.WriteAllText(Path.Combine(outDir, "entities.tsv"), entities.ToString(), utf8);
    File.WriteAllText(Path.Combine(outDir, "strings.tsv"), sb.ToString(), utf8);
    var words = stringList.Sum(s => s.Text.Split(' ', StringSplitOptions.RemoveEmptyEntries).Length);
    Console.WriteLine($"Prototipos: {protos.Count} (duplicados: {dupes}, parches aplicados: {patched}). Entidades con texto: {count}.");
    foreach (var g in stringList.GroupBy(s => s.Kind))
        Console.WriteLine($"  {g.Key}: {g.Count()} textos únicos, {g.Sum(s => s.Text.Split(' ', StringSplitOptions.RemoveEmptyEntries).Length)} palabras");
    Console.WriteLine($"Total: {stringList.Count} textos únicos, {words} palabras.");
    return 0;
}
else
{
    // Textos actuales (de extract): índice -> (tipo, inglés).
    var current = new Dictionary<int, (string Kind, string Text)>();
    foreach (var line in File.ReadLines(Path.Combine(outDir, "strings.tsv"), Encoding.UTF8).Skip(1))
    {
        var p = line.Split('\t', 3);
        if (p.Length == 3 && int.TryParse(p[0], out var idx))
            current[idx] = (p[1], p[2]);
    }

    // Memoria de traducción: (tipo, inglés) -> español.
    var memoryPath = Path.Combine(repo, "Tools", "argentea", "EntLoc", "traducciones.tsv");
    var memory = new Dictionary<(string, string), string>();
    if (File.Exists(memoryPath))
    {
        foreach (var line in File.ReadLines(memoryPath, Encoding.UTF8).Skip(1))
        {
            var p = line.Split('\t', 3);
            if (p.Length == 3)
                memory[(p[0], p[1])] = p[2];
        }
    }

    var newTranslations = Path.Combine(outDir, "strings.es.tsv");
    if (File.Exists(newTranslations))
    {
        var added = 0;
        foreach (var line in File.ReadLines(newTranslations, Encoding.UTF8))
        {
            var tab = line.IndexOf('\t');
            if (tab > 0 && int.TryParse(line.TrimStart('﻿')[..tab], out var idx) && current.TryGetValue(idx, out var src))
            {
                memory[(src.Kind, src.Text)] = line[(tab + 1)..];
                added++;
            }
        }

        var mem = new StringBuilder("kind\ten\tes\n");
        foreach (var ((kind, en), es) in memory.OrderBy(m => m.Key.Item1, StringComparer.Ordinal).ThenBy(m => m.Key.Item2, StringComparer.Ordinal))
            mem.Append($"{kind}\t{en}\t{es}\n");
        File.WriteAllText(memoryPath, mem.ToString(), utf8);
        Console.WriteLine($"Memoria de traducción: {added} textos agregados desde strings.es.tsv, {memory.Count} en total.");
    }

    var translated = new Dictionary<int, string>();
    var pending = new StringBuilder("index\tkind\ttext\n");
    foreach (var (idx, src) in current.OrderBy(c => c.Key))
    {
        if (memory.TryGetValue(src, out var es))
            translated[idx] = es;
        else
            pending.Append($"{idx}\t{src.Kind}\t{src.Text}\n");
    }
    File.WriteAllText(Path.Combine(outDir, "faltantes.tsv"), pending.ToString(), utf8);

    var targetRoot = Path.Combine(repo, "Resources", "Locale", "es-419", "_prototypes");
    if (Directory.Exists(targetRoot))
        Directory.Delete(targetRoot, true);

    var byFile = new SortedDictionary<string, StringBuilder>(StringComparer.Ordinal);
    int entries = 0, missing = 0, skipped = 0;
    foreach (var line in File.ReadLines(Path.Combine(outDir, "entities.tsv"), Encoding.UTF8).Skip(1))
    {
        var f = line.Split('\t');
        string? T(string s) => int.TryParse(s, out var i) && i >= 0 ? (translated.TryGetValue(i, out var t) ? t : null) : null;
        bool Has(string s) => int.TryParse(s, out var i) && i >= 0;

        // Fluent solo admite [A-Za-z0-9_-] en las claves (p. ej. "MailingUnitR&D" no se puede traducir).
        if (!f[0].All(c => char.IsAsciiLetterOrDigit(c) || c is '_' or '-'))
        {
            skipped++;
            continue;
        }

        var (name, desc, suffix) = (T(f[2]), T(f[3]), T(f[4]));
        missing += (Has(f[2]) && name == null ? 1 : 0) + (Has(f[3]) && desc == null ? 1 : 0) + (Has(f[4]) && suffix == null ? 1 : 0);
        if (name == null && desc == null && suffix == null)
            continue;

        var ftl = Path.ChangeExtension(f[1], ".ftl");
        if (!byFile.TryGetValue(ftl, out var sb))
            byFile[ftl] = sb = new StringBuilder();

        // Sin nombre traducido, "ent-X =" vacío deja el nombre en inglés y solo sobrescribe atributos.
        sb.Append($"ent-{f[0]} =");
        if (name != null)
            sb.Append(' ').Append(Escape(name));
        sb.Append('\n');
        if (desc != null)
            sb.Append("    .desc = ").Append(Escape(desc)).Append('\n');
        if (suffix != null)
            sb.Append("    .suffix = ").Append(Escape(suffix)).Append('\n');
        entries++;
    }

    foreach (var (rel, sb) in byFile)
    {
        var path = Path.Combine(targetRoot, rel);
        Directory.CreateDirectory(Path.GetDirectoryName(path)!);
        File.WriteAllText(path, sb.ToString(), utf8);
    }

    Console.WriteLine($"Archivos: {byFile.Count}. Entradas ent-: {entries}. Textos sin traducir: {missing}. IDs no válidos para Fluent: {skipped}.");
    return 0;
}

static YamlNode? Child(YamlMappingNode node, string key)
    => node.Children.TryGetValue(new YamlScalarNode(key), out var v) ? v : null;

static List<string>? VariantValues(YamlMappingNode node)
    => Child(node, "values") is YamlSequenceNode seq
        ? seq.Children.OfType<YamlScalarNode>().Select(s => s.Value ?? "").ToList()
        : null;

// Valor de un campo para la variante i: escalar común o "!type:CreateVariants { values: [...] }".
static string? Field(YamlMappingNode node, string key, int i)
    => Child(node, key) switch
    {
        YamlScalarNode s => s.Value,
        YamlMappingNode m when VariantValues(m) is { } v && i < v.Count => v[i],
        _ => null,
    };

static List<string> Parents(YamlNode? node, int i)
{
    switch (node)
    {
        case YamlScalarNode { Value: { } v }:
            return [v];
        case YamlSequenceNode seq:
            return seq.Children.OfType<YamlScalarNode>().Select(s => s.Value!).Where(v => v != null).ToList();
        case YamlMappingNode m:
            if (VariantValues(m) is { } values && i < values.Count)
                return [values[i]];
            if (Child(m, "sequences") is YamlSequenceNode seqs && i < seqs.Children.Count && seqs.Children[i] is YamlSequenceNode one)
                return one.Children.OfType<YamlScalarNode>().Select(s => s.Value!).Where(v => v != null).ToList();
            return [];
        default:
            return [];
    }
}

// Una sola línea: los saltos de línea del YAML se convierten en espacios.
static string Normalize(string text)
    => string.Join(' ', text.Split(['\r', '\n', '\t'], StringSplitOptions.RemoveEmptyEntries).Select(s => s.Trim())).Trim();

// Fluent: las llaves se escriben como literales y un valor no puede empezar con [ * .
static string Escape(string text)
{
    var sb = new StringBuilder();
    for (var i = 0; i < text.Length; i++)
    {
        var c = text[i];
        if (c is '{' or '}' || (i == 0 && c is '[' or '*' or '.'))
            sb.Append("{\"").Append(c).Append("\"}");
        else
            sb.Append(c);
    }
    return sb.ToString();
}

record Proto(string Id, string File, List<string> Parents, bool Abstract, string? Name, string? Desc, string? Suffix);
