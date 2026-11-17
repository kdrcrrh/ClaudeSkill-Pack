# Claude Haritası — repodan kategori kurulumu (Windows) / install a category from this repo
# Kullanım / Usage:  powershell -ExecutionPolicy Bypass -File kur.ps1 video      (tasarim | video | yazi | kodlama | verimlilik | hepsi/all)
param([Parameter(Mandatory)][string]$Kategori, [switch]$Force)
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$cats = (Get-ChildItem (Join-Path $here 'plugins') -Directory).Name
$sec = if ($Kategori -in 'hepsi','all') { $cats } else { @($Kategori) }
foreach ($c in $sec) { if ($c -notin $cats) { throw "Bilinmeyen kategori / unknown category: $c  ($($cats -join ', '))" } }
if ('verimlilik' -notin $sec) { $sec += 'verimlilik' }   # harita her zaman / router always included
$dst = Join-Path $HOME '.claude\skills'; New-Item -ItemType Directory -Force $dst | Out-Null
foreach ($c in $sec) {
    foreach ($s in Get-ChildItem (Join-Path $here "plugins\$c\skills") -Directory) {
        $t = Join-Path $dst $s.Name
        if ((Test-Path $t) -and -not $Force) { Write-Host "  = $($s.Name) zaten var / already installed"; continue }
        if (Test-Path $t) { Remove-Item $t -Recurse -Force }
        Copy-Item $s.FullName $t -Recurse; Write-Host "  + $($s.Name)  [$c]"
    }
}
Write-Host "`nBitti / Done. Yeni bir Claude Code oturumu aç / open a new Claude Code session."
Write-Host "Sorumluluk reddi / Disclaimer: DISCLAIMER.md · Kaynaklar / Credits: TESEKKURLER.md"
