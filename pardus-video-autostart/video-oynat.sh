#!/usr/bin/env bash
# Oturum açıldığında videoyu tam ekran oynatır.
VIDEO="$HOME/.local/share/oturum-videosu/video"
BEKLE=5   # masaüstünün tam yüklenmesi için beklenecek saniye

[ -f "$VIDEO" ] || exit 0
sleep "$BEKLE"

if command -v mpv >/dev/null 2>&1; then
    exec mpv --fullscreen --no-terminal "$VIDEO"
elif command -v vlc >/dev/null 2>&1; then
    exec vlc --fullscreen --play-and-exit --no-video-title-show "$VIDEO"
elif command -v totem >/dev/null 2>&1; then
    exec totem --fullscreen "$VIDEO"
else
    exec xdg-open "$VIDEO"
fi
