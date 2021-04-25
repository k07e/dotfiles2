# ref: https://github.com/danhper/fundle#automatic-install
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# prompt
fundle plugin jorgebucaran/hydro

# auto-complete matching pairs
fundle plugin jorgebucaran/autopair.fish

# sparklines
fundle plugin jorgebucaran/spark.fish

fundle init

source ~/.config/fish/aliases.fish

set -x EDITOR vim
set -x MANPAGER 'nvim +Man!'
set -x LESS (echo -en '--mouse --raw-control-chars --wheel-lines=3 --prompt=\033[00m\033[43m \033[00m\033[33m\033[00m ')
