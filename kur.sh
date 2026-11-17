#!/usr/bin/env bash
# Claude Haritası — repodan kategori kurulumu (macOS/Linux) / install a category from this repo
# Kullanım / Usage:  bash kur.sh video [--force]      (tasarim | video | yazi | kodlama | verimlilik | hepsi/all)
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
cat="${1:?Kategori gerekli / category required: tasarim | video | yazi | kodlama | verimlilik | hepsi}"
force=0; [ "${2:-}" = "--force" ] && force=1
if [ "$cat" = "hepsi" ] || [ "$cat" = "all" ]; then sel=$(ls "$here/plugins"); else
  [ -d "$here/plugins/$cat" ] || { echo "Bilinmeyen kategori / unknown category: $cat"; exit 1; }
  sel="$cat verimlilik"; fi   # harita her zaman / router always included
dst="$HOME/.claude/skills"; mkdir -p "$dst"
for c in $sel; do
  for s in "$here/plugins/$c/skills"/*/; do
    n="$(basename "$s")"
    if [ -e "$dst/$n" ] && [ $force -eq 0 ]; then echo "  = $n zaten var / already installed"; continue; fi
    rm -rf "$dst/$n"; cp -R "$s" "$dst/$n"; echo "  + $n  [$c]"
  done
done
echo; echo "Bitti / Done. Yeni bir Claude Code oturumu aç / open a new Claude Code session."
echo "Sorumluluk reddi / Disclaimer: DISCLAIMER.md · Kaynaklar / Credits: TESEKKURLER.md"
