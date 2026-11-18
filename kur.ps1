# Claude Haritası — repodan kategori kurulumu (Windows) / install a category from this repo
# Kullanım / Usage:  powershell -ExecutionPolicy Bypass -File kur.ps1 video      (tasarim | video | yazi | kodlama | verimlilik | ajanlar | hepsi/all)
param([Parameter(Mandatory)][string]$Kategori, [switch]$Force)
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$cats = (Get-ChildItem (Join-Path $here 'plugins') -Directory).Name
$sec = if ($Kategori -in 'hepsi','all') { $cats } else { @($Kategori) }
foreach ($c in $sec) { if ($c -notin $cats) { throw "Bilinmeyen kategori / unknown category: $c  ($($cats -join ', '))" } }
if ('verimlilik' -notin $sec) { $sec += 'verimlilik' }   # harita her zaman / router always included
$dst = Join-Path $HOME '.claude\skills'; New-Item -ItemType Directory -Force $dst | Out-Null
$adst = Join-Path $HOME '.claude\agents'
foreach ($c in $sec) {
    $ag = Join-Path $here "plugins\$c\agents"
    if (Test-Path $ag) {   # alt ajanlar / subagents
        New-Item -ItemType Directory -Force $adst | Out-Null; $na = 0; $nk = 0
        foreach ($a in Get-ChildItem $ag -Filter *.md -File) {
            $t = Join-Path $adst $a.Name
            if ((Test-Path $t) -and -not $Force) { $nk++; continue }
            Copy-Item $a.FullName $t -Force; $na++
        }
        Write-Host "  + $na ajan / agents -> $adst  [$c]"; if ($nk) { Write-Host "  = $nk zaten var / already installed" }
    }
    if (-not (Test-Path (Join-Path $here "plugins\$c\skills"))) { continue }
    foreach ($s in Get-ChildItem (Join-Path $here "plugins\$c\skills") -Directory) {
        $t = Join-Path $dst $s.Name
        if ((Test-Path $t) -and -not $Force) { Write-Host "  = $($s.Name) zaten var / already installed"; continue }
        if (Test-Path $t) { Remove-Item $t -Recurse -Force }
        Copy-Item $s.FullName $t -Recurse; Write-Host "  + $($s.Name)  [$c]"
    }
}
Write-Host "`nBitti / Done. Yeni bir Claude Code oturumu aç / open a new Claude Code session."
Write-Host "Sorumluluk reddi / Disclaimer: DISCLAIMER.md · Kaynaklar / Credits: TESEKKURLER.md"
