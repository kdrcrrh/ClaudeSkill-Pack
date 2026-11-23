#!/usr/bin/env bash
# Kullanım: ./kur.sh /yol/videom.mp4
set -e
if [ -z "$1" ] || [ ! -f "$1" ]; then
    echo "Kullanım: $0 /yol/videom.mp4"
    exit 1
fi

HEDEF="$HOME/.local/share/oturum-videosu"
mkdir -p "$HEDEF" "$HOME/.config/autostart"

cp "$1" "$HEDEF/video"
cp "$(dirname "$0")/video-oynat.sh" "$HEDEF/video-oynat.sh"
chmod +x "$HEDEF/video-oynat.sh"

cat > "$HOME/.config/autostart/oturum-videosu.desktop" <<DESK
[Desktop Entry]
Type=Application
Name=Oturum Videosu
Comment=Oturum açılınca videoyu oynatır
Exec=$HEDEF/video-oynat.sh
Terminal=false
X-GNOME-Autostart-enabled=true
Hidden=false
DESK

echo "Kuruldu. Bir sonraki oturum açılışında video oynatılacak."
command -v mpv >/dev/null || command -v vlc >/dev/null || \
    echo "Not: mpv veya vlc kurulu değil. Kurmak için: sudo apt install mpv"
