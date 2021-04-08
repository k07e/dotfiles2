# ref: https://github.com/danhper/fundle#automatic-install
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# prompt
fundle plugin jorgebucaran/hydro

# auto-complete matching pairs
fundle plugin jorgebucaran/autopair.fish

fundle init
