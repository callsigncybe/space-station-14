# Valida una parte de la traducción de nombres de objetos.
# Uso: & .\Tools\argentea\validar-objetos.ps1 parteN.tsv parteN.es.tsv
# parteN.tsv:    índice<TAB>tipo<TAB>texto en inglés   (generado por EntLoc.cs extract)
# parteN.es.tsv: índice<TAB>traducción                 (una línea por cada índice)
param(
    [Parameter(Mandatory)][string]$Original,
    [Parameter(Mandatory)][string]$Traduccion
)

$tag = '\[/[A-Za-z]+\]|\[[A-Za-z]+(?==)|\[(bold|italic|bolditalic|mono|bullet|head|br|scramble)(?=[\]\s])'
function Get-Set([string]$text, [string]$pattern) {
    @([regex]::Matches($text, $pattern) | ForEach-Object { $_.Value } | Sort-Object -Unique) -join ' '
}

$en = [ordered]@{}
foreach ($line in [IO.File]::ReadAllLines($Original)) {
    $p = $line.TrimStart([char]0xFEFF) -split "`t", 3
    if ($p.Count -eq 3) { $en[$p[0]] = $p[2] }
}

$errores = 0
if (-not (Test-Path $Traduccion)) { Write-Output "FALTA el archivo $Traduccion"; exit 1 }
$es = @{}
$n = 0
foreach ($line in [IO.File]::ReadAllLines($Traduccion)) {
    $n++
    $l = $line.TrimStart([char]0xFEFF)
    if (-not $l.Trim()) { continue }
    $p = $l -split "`t"
    if ($p.Count -ne 2) { Write-Output "FORMATO   línea $n no tiene exactamente un TAB: $l"; $errores++; continue }
    if (-not $en.Contains($p[0])) { Write-Output "SOBRA     índice $($p[0]) no está en el original"; $errores++; continue }
    if ($es.ContainsKey($p[0])) { Write-Output "REPETIDO  índice $($p[0])"; $errores++; continue }
    if (-not $p[1].Trim()) { Write-Output "VACÍO     índice $($p[0])"; $errores++ }
    $es[$p[0]] = $p[1]
}

foreach ($k in $en.Keys) {
    if (-not $es.ContainsKey($k)) { Write-Output "FALTA     índice $k : $($en[$k])"; $errores++; continue }
    $a = $en[$k]; $b = $es[$k]
    if ((Get-Set $a $tag) -ne (Get-Set $b $tag)) { Write-Output "ETIQUETAS índice $k  en: $a  |  es: $b"; $errores++ }
    foreach ($c in '{', '}', '[', ']') {
        $ca = ($a.ToCharArray() | Where-Object { $_ -eq $c }).Count
        $cb = ($b.ToCharArray() | Where-Object { $_ -eq $c }).Count
        if ($ca -ne $cb) { Write-Output "SIGNOS    índice $k  cantidad de '$c' distinta  en: $a  |  es: $b"; $errores++; break }
    }
}
Write-Output "Revisados $($en.Count) textos, $errores problemas."
