#!/usr/bin/env bash
# Çift tıklayınca çalışır: "a" adlı videoyu bulur ve oturum açılışında oynatılmak üzere kurar.

mesaj() {
    if command -v zenity >/dev/null 2>&1; then zenity --"$1" --title="Oturum Videosu" --text="$2" 2>/dev/null
    elif command -v notify-send >/dev/null 2>&1; then notify-send "Oturum Videosu" "$2"
    else echo "$2"; fi
}

# 1) "a" adlı videoyu yaygın klasörlerde ara
VIDEO=""
for klasor in "$(dirname "$(readlink -f "$0")")" "$HOME" "$HOME/Videolar" "$HOME/Videos" \
              "$HOME/Masaüstü" "$HOME/Desktop" "$HOME/İndirilenler" "$HOME/Downloads"; do
    for dosya in "$klasor"/a "$klasor"/a.*; do
        case "$dosya" in *.sh|*.desktop|*.txt) continue ;; esac
        [ -f "$dosya" ] && { VIDEO="$dosya"; break 2; }
    done
done

# 2) Bulunamazsa kullanıcıya seçtir
if [ -z "$VIDEO" ] && command -v zenity >/dev/null 2>&1; then
    VIDEO=$(zenity --file-selection --title="Oynatılacak videoyu seçin" 2>/dev/null)
fi
if [ -z "$VIDEO" ] || [ ! -f "$VIDEO" ]; then
    mesaj error "\"a\" adlı video bulunamadı.\nVideoyu bu dosyanın yanına, Videolar ya da Masaüstü klasörüne koyup tekrar deneyin."
    exit 1
fi

# 3) Kurulum
HEDEF="$HOME/.local/share/oturum-videosu"
mkdir -p "$HEDEF" "$HOME/.config/autostart"
cp "$VIDEO" "$HEDEF/video"

cat > "$HEDEF/video-oynat.sh" <<'OYNAT'
#!/usr/bin/env bash
VIDEO="$HOME/.local/share/oturum-videosu/video"
[ -f "$VIDEO" ] || exit 0
sleep 5
if command -v mpv >/dev/null 2>&1; then exec mpv --fullscreen --no-terminal "$VIDEO"
elif command -v vlc >/dev/null 2>&1; then exec vlc --fullscreen --play-and-exit --no-video-title-show "$VIDEO"
elif command -v totem >/dev/null 2>&1; then exec totem --fullscreen "$VIDEO"
else exec xdg-open "$VIDEO"; fi
OYNAT
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

NOT=""
command -v mpv >/dev/null || command -v vlc >/dev/null || \
    NOT="\n\nNot: mpv veya VLC kurulu değil. Uygulama Merkezi'nden VLC kurmanız önerilir."
mesaj info "Kurulum tamamlandı!\n\nVideo: $(basename "$VIDEO")\nBir sonraki oturum açılışında otomatik oynatılacak.$NOT"
