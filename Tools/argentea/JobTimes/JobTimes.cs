#:package YamlDotNet@16.3.0

// Genera la override de requisitos de tiempo de [ES][MRP] Argentea Station.
//
//   dotnet run Tools/argentea/JobTimes/JobTimes.cs -- <repo>
//
// Lee los trabajos de Resources/Prototypes (aplicando parches !PartialOnly de Starlight) y escribe
// Resources/Prototypes/_Argentea/Roles/requirement_overrides.yml con el prototipo
// jobRequirementOverride "Argentea": los mínimos de tiempo divididos por Factor, salvo en los roles de
// Keep. Los límites máximos (inverted: true) y los requisitos que no son de tiempo quedan igual.
// Se activa con game.role_timer_override = "Argentea".

using System.Globalization;
using System.Text;
using YamlDotNet.RepresentationModel;

const double Factor = 4;

// Roles de comando y especiales: mantienen sus tiempos.
var keep = new HashSet<string>
{
    // Jefes
    "Captain", "HeadOfPersonnel", "HeadOfSecurity", "ChiefEngineer", "ChiefMedicalOfficer", "ResearchDirector", "Quartermaster",
    // CentCom, ERT y escuadrones
    "CentralCommandOfficial", "CentCommBartender", "CentCommChef", "CentCommJanitor", "CentCommServiceWorker",
    "CentralCommandGreenShield", "Decimus", "NTNCBlueShield", "NanoTrasenSpecialForces",
    "CBURN", "DeathSquad", "ERTLeader", "ERTChaplain", "ERTJanitor", "ERTMedical", "ERTSecurity", "ERTEngineer",
    // Representantes
    "BlueShield", "IAA", "Magistrate", "NanoTrasenRepresentative", "NanotrasenCareerTrainer",
    // Fuerzas TSF
    "SolGovOfficer", "SolGovOfficerSheriff", "TSFMCCrew", "TSFMarine", "TSFMarineElite",
};

var timeRequirements = new HashSet<string> { "!type:DepartmentTimeRequirement", "!type:RoleTimeRequirement", "!type:OverallPlaytimeRequirement" };

if (args.Length != 1)
{
    Console.Error.WriteLine("Uso: JobTimes.cs <repo>");
    return 1;
}

var repo = Path.GetFullPath(args[0]);
var protoDir = Path.Combine(repo, "Resources", "Prototypes");
var requirements = new Dictionary<string, YamlSequenceNode>();
var partials = new List<(string Id, YamlSequenceNode Reqs)>();

foreach (var file in Directory.EnumerateFiles(protoDir, "*.yml", SearchOption.AllDirectories))
{
    var stream = new YamlStream();
    try
    {
        using var reader = new StreamReader(file);
        stream.Load(reader);
    }
    catch
    {
        continue;
    }

    foreach (var doc in stream.Documents)
    {
        if (doc.RootNode is not YamlSequenceNode seq)
            continue;

        foreach (var node in seq.Children.OfType<YamlMappingNode>())
        {
            if (Child(node, "type") is not YamlScalarNode { Value: "job" } type || Child(node, "id") is not YamlScalarNode { Value: { } id })
                continue;
            if (Child(node, "requirements") is not YamlSequenceNode reqs)
                continue;

            var partial = !type.Tag.IsEmpty && !type.Tag.IsNonSpecific && type.Tag.Value == "!PartialOnly";
            if (partial)
                partials.Add((id, reqs));
            else
                requirements[id] = reqs;
        }
    }
}

foreach (var (id, reqs) in partials)
    requirements[id] = reqs;

var sb = new StringBuilder();
sb.AppendLine("# Generado por Tools/argentea/JobTimes/JobTimes.cs; no editar a mano.");
sb.AppendLine($"# Mínimos de tiempo divididos por {Factor} para todos los trabajos salvo comando y roles especiales.");
sb.AppendLine("# Se activa con game.role_timer_override = \"Argentea\" (Resources/ConfigPresets/Argentea/argentea.toml).");
sb.AppendLine("- type: jobRequirementOverride");
sb.AppendLine("  id: Argentea");
sb.AppendLine("  jobs:");

var summary = new List<string>();
foreach (var (id, reqs) in requirements.OrderBy(r => r.Key, StringComparer.Ordinal))
{
    if (keep.Contains(id))
        continue;

    var changes = new List<string>();
    var body = new StringBuilder();
    foreach (var req in reqs.Children.OfType<YamlMappingNode>())
    {
        var tag = req.Tag.IsEmpty || req.Tag.IsNonSpecific ? "" : req.Tag.Value;
        var inverted = Child(req, "inverted") is YamlScalarNode { Value: "true" };
        var first = true;
        foreach (var (k, v) in req.Children)
        {
            var key = ((YamlScalarNode) k).Value!;
            var prefix = first ? $"    - {tag}\n      " : "      ";
            first = false;

            if (key == "time" && timeRequirements.Contains(tag) && !inverted && v is YamlScalarNode { Value: { } raw })
            {
                var seconds = ParseSeconds(raw);
                var reduced = seconds / Factor;
                body.Append(prefix).Append($"time: {Format(reduced)} # antes {raw}\n");
                if (seconds > 0)
                    changes.Add($"{Describe(req)} {Human(seconds)} -> {Human(reduced)}");
                continue;
            }

            body.Append(prefix).Append(key).Append(':');
            WriteValue(body, v, 6);
        }
        if (first)
            body.Append($"    - {tag}\n");
    }

    if (changes.Count == 0)
        continue;

    sb.AppendLine($"    {id}:");
    sb.Append(body);
    summary.Add($"{id}: {string.Join("; ", changes)}");
}

var outPath = Path.Combine(protoDir, "_Argentea", "Roles", "requirement_overrides.yml");
Directory.CreateDirectory(Path.GetDirectoryName(outPath)!);
File.WriteAllText(outPath, sb.ToString().Replace("\r\n", "\n"), new UTF8Encoding(false));
foreach (var line in summary)
    Console.WriteLine(line);
Console.WriteLine($"Trabajos con tiempos reducidos: {summary.Count}. Archivo: {outPath}");
return 0;

static YamlNode? Child(YamlMappingNode node, string key)
    => node.Children.TryGetValue(new YamlScalarNode(key), out var v) ? v : null;

static void WriteValue(StringBuilder sb, YamlNode node, int indent)
{
    switch (node)
    {
        case YamlScalarNode s:
            sb.Append(' ').Append(s.Value).Append('\n');
            break;
        case YamlSequenceNode seq:
            sb.Append('\n');
            foreach (var item in seq.Children)
            {
                sb.Append(new string(' ', indent)).Append('-');
                WriteValue(sb, item, indent + 2);
            }
            break;
        case YamlMappingNode map:
            sb.Append('\n');
            foreach (var (k, v) in map.Children)
            {
                sb.Append(new string(' ', indent + 2)).Append(((YamlScalarNode) k).Value).Append(':');
                WriteValue(sb, v, indent + 4);
            }
            break;
    }
}

static string Describe(YamlMappingNode req)
    => Child(req, "department") is YamlScalarNode { Value: { } d } ? $"departamento {d}"
     : Child(req, "role") is YamlScalarNode { Value: { } r } ? $"rol {r}"
     : "tiempo total";

// SS14 acepta "10h", "90m", "30s" o segundos sin unidad.
static double ParseSeconds(string raw)
{
    raw = raw.Trim();
    var unit = raw[^1];
    var number = char.IsLetter(unit) ? raw[..^1] : raw;
    var value = double.Parse(number, CultureInfo.InvariantCulture);
    return unit switch
    {
        'h' => value * 3600,
        'm' => value * 60,
        's' => value,
        _ => value,
    };
}

static string Format(double seconds)
{
    if (seconds % 3600 == 0)
        return $"{seconds / 3600:0}h";
    if (seconds % 60 == 0)
        return $"{seconds / 60:0}m";
    return seconds.ToString("0", CultureInfo.InvariantCulture);
}

static string Human(double seconds)
    => seconds >= 3600 ? $"{seconds / 3600:0.##} h".Replace(',', '.') : $"{seconds / 60:0.#} min".Replace(',', '.');
