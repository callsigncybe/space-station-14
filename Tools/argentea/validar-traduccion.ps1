# Valida archivos traducidos contra su original en inglés: claves, atributos, variables,
# etiquetas, llaves y líneas que Fluent no admite.
# Uso: & .\Tools\argentea\validar-traduccion.ps1 lista.tsv
# lista.tsv: una línea por archivo con "<ruta en-US><TAB><ruta es-419>".
param([Parameter(Mandatory)][string]$Lote)

function Get-Msgs([string]$path) {
    # Devuelve un diccionario clave -> texto (incluye atributos como "clave.attr").
    $msgs = [ordered]@{}
    $cur = $null
    foreach ($line in [IO.File]::ReadAllLines($path)) {
        $l = $line.TrimStart([char]0xFEFF)
        if ($l -match '^(-?[A-Za-z][A-Za-z0-9_-]*)\s*=(.*)$') {
            $cur = $matches[1]; $msgs[$cur] = $matches[2]
        } elseif ($l -match '^\s+\.([A-Za-z][A-Za-z0-9_-]*)\s*=(.*)$' -and $cur) {
            $base = ($cur -split '\.')[0]
            $cur = "$base.$($matches[1])"; $msgs[$cur] = $matches[2]
        } elseif ($l -match '^#' -or $l -match '^\s*$') {
            # comentario o línea vacía: no corta el mensaje multilínea
        } elseif ($cur) {
            # continuación (incluye "}" o "*[other]" en la primera columna)
            $msgs[$cur] += "`n" + $l
        }
    }
    return $msgs
}

function Get-Set([string]$text, [string]$pattern) {
    return @([regex]::Matches($text, $pattern) | ForEach-Object { $_.Value } | Sort-Object -Unique)
}

$errores = 0; $archivos = 0
foreach ($row in [IO.File]::ReadAllLines($Lote)) {
    $row = $row.TrimStart([char]0xFEFF)
    if (-not $row.Trim()) { continue }
    $src, $dst = $row -split "`t"
    $archivos++
    if (-not (Test-Path $dst)) { Write-Output "FALTA     $dst"; $errores++; continue }
    # Fluent no admite líneas de continuación que empiecen con '[' (salvo ramas de selector), '*' o '.'.
    $n = 0
    foreach ($line in [IO.File]::ReadAllLines($dst)) {
        $n++
        if ($line -match '^[ \t]+(\[[A-Za-z]+[= ]|\[/|\[(bold|italic|bolditalic|mono|bullet|head|br)\]|\*[^\[]|\.[^A-Za-z])') {
            Write-Output "INICIO    $dst  línea $n empieza con '[', '*' o '.': $($line.Trim())"; $errores++
        }
    }
    $a = Get-Msgs $src; $b = Get-Msgs $dst
    $faltan = @($a.Keys | Where-Object { -not $b.Contains($_) })
    $sobran = @($b.Keys | Where-Object { -not $a.Contains($_) })
    if ($faltan) { Write-Output "CLAVES    $dst  faltan: $($faltan -join ', ')"; $errores++ }
    if ($sobran) { Write-Output "CLAVES    $dst  sobran: $($sobran -join ', ')"; $errores++ }
    foreach ($k in $a.Keys) {
        if (-not $b.Contains($k)) { continue }
        $va = Get-Set $a[$k] '\$[A-Za-z][A-Za-z0-9_-]*'
        $vb = Get-Set $b[$k] '\$[A-Za-z][A-Za-z0-9_-]*'
        if (($va -join ',') -ne ($vb -join ',')) { Write-Output "VARIABLES $dst  [$k] en: $($va -join ' ')  es: $($vb -join ' ')"; $errores++ }
        # Etiquetas de formato: [/x], [x=...] o etiquetas sin valor conocidas.
        $tag = '\[/[A-Za-z]+\]|\[[A-Za-z]+(?==)|\[(bold|italic|bolditalic|mono|bullet|head|br|scramble)(?=[\]\s])'
        $ta = Get-Set $a[$k] $tag
        $tb = Get-Set $b[$k] $tag
        if (($ta -join ',') -ne ($tb -join ',')) { Write-Output "ETIQUETAS $dst  [$k] en: $($ta -join ' ')  es: $($tb -join ' ')"; $errores++ }
        $oa = ([regex]::Matches($b[$k], '\{')).Count; $ob = ([regex]::Matches($b[$k], '\}')).Count
        if ($oa -ne $ob) { Write-Output "LLAVES    $dst  [$k] { y } no cierran ($oa vs $ob)"; $errores++ }
    }
}
Write-Output "Revisados $archivos archivos, $errores problemas."
