if status is-interactive
# Commands to run in interactive sessions can go here
set -g fish_greeting ""
end
set -gx TERM xterm-256color
# nnn earthy green/brown theme
# nnn using Alacritty's normal green
set -gx NNN_COLORS '#02020303;2222'

# block char dir exe regular hardlink symlink missing orphan fifo socket other
set -gx NNN_FCOLORS '000002020003080808080300'
set -gx NNN_OPTS 'eH'

# --- PATH ---
# binarios de usuario (~/.local/bin)
if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

# node instalado via nvm (nvm e bash-only; aqui adicionamos o node ativo ao PATH,
# que e onde ficam binarios como claude, npm, npx)
if test -d $HOME/.nvm/versions/node
    set -l _node_latest (ls $HOME/.nvm/versions/node | sort -V | tail -1)
    test -n "$_node_latest"; and fish_add_path $HOME/.nvm/versions/node/$_node_latest/bin
end
