#!/usr/bin/env bash
# Aplica os configs deste repo no sistema (repo -> ~/.config).
# Use quando editar os arquivos aqui no repo e quiser que valham no sistema.
set -e
REPO="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.config"

for d in alacritty i3 i3status rofi micro gtk-3.0 gtk-4.0; do
    rm -rf "$DEST/$d"
    cp -r "$REPO/config/$d" "$DEST/$d"
done

# fish: só config.fish + functions (preserva fish_variables/completions/conf.d do sistema)
mkdir -p "$DEST/fish/functions"
cp "$REPO/config/fish/config.fish" "$DEST/fish/config.fish"
cp "$REPO/config/fish/functions/"*.fish "$DEST/fish/functions/" 2>/dev/null || true

# wallpaper
mkdir -p "$HOME/Pictures/wallpapers"
cp "$REPO/wallpapers/wallpaper.jpg" "$HOME/Pictures/wallpapers/wallpaper.jpg"

echo "Aplicado no ~/.config. Recarregue o i3 com Mod+Shift+R (ou: i3-msg restart)."
