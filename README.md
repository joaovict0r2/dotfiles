# dotfiles

Configs do meu ricing **i3 + Manjaro** (X11), estética *earthy*.

Repositório simples e local: os arquivos ficam **direto** aqui dentro, sem symlink,
sem stow. A pasta `config/` espelha o `~/.config`.

```
dotfiles/
├─ config/        # = ~/.config
│  ├─ alacritty/  ├─ fish/   ├─ i3/   ├─ i3status/
│  ├─ rofi/       ├─ micro/  ├─ gtk-3.0/  └─ gtk-4.0/
├─ wallpapers/
├─ sync.sh        # copia ~/.config -> repo (rode antes de commitar)
└─ README.md
```

## Fluxo do dia a dia

Eu edito os configs normalmente em `~/.config/...` (é de onde o sistema lê).
Pra versionar as mudanças:

```fish
cd ~/dotfiles
./sync.sh                 # copia ~/.config -> config/ e o wallpaper
git add -A
git commit -m "..."
git push
```

## Aplicar numa máquina nova

```fish
git clone git@github.com:joaovict0r2/dotfiles.git ~/dotfiles
cp -r ~/dotfiles/config/. ~/.config/
cp ~/dotfiles/wallpapers/wallpaper.jpg ~/Pictures/wallpapers/
```

## Detalhes

- Tecla **Super (Mod4)**, teclado **ABNT2** (`ccedilla`/ç no lugar de `;`).
- Paleta earthy `#1a1d15` / `#9aac6f`; fonte **Hack Nerd Font** (ícones da barra).
- Barra **i3status** (sem polybar); launcher **rofi**; shell **fish**; terminal **alacritty**.
- Áudio via **PipeWire** (systemd user: pipewire + pipewire-pulse + wireplumber).
  Não instalar o pacote `pulseaudio` (conflita com `pipewire-pulse`).

### Dependências

`i3-wm i3status alacritty rofi fish micro feh maim slop xclip pamixer brightnessctl`
`i3lock network-manager-applet dex nnn pavucontrol` + **Hack Nerd Font**.
