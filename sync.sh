#!/usr/bin/env bash
# Copia os configs atuais do ~/.config para este repo (live -> repo).
# Rode antes de 'git add/commit/push'.
set -e
REPO="$(cd "$(dirname "$0")" && pwd)"
SRC="$HOME/.config"

for d in alacritty i3 i3status rofi micro gtk-3.0 gtk-4.0; do
    rm -rf "$REPO/config/$d"
    cp -r "$SRC/$d" "$REPO/config/$d"
done

# fish: apenas config.fish + functions (sem fish_variables/completions/conf.d)
rm -rf "$REPO/config/fish"
mkdir -p "$REPO/config/fish/functions"
cp "$SRC/fish/config.fish" "$REPO/config/fish/config.fish"
cp "$SRC/fish/functions/"*.fish "$REPO/config/fish/functions/" 2>/dev/null || true

# wallpaper
mkdir -p "$REPO/wallpapers"
cp "$HOME/Pictures/wallpapers/wallpaper.jpg" "$REPO/wallpapers/wallpaper.jpg"

echo "Sincronizado. Agora: git add -A && git commit -m '...' && git push"
