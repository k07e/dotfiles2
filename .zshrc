# Created by newuser for 5.8

# ref: https://github.com/zdharma/zinit#option-2---manual-installation
# change point: add if statements
if [ ! -e ~/.zinit ]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
fi
if [ -f ~/.zinit/bin/zinit.zsh ]; then
  source ~/.zinit/bin/zinit.zsh
fi
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light olets/zsh-abbr
zinit ice if'[ "$(uname -m)" = "x86_64" ]' from'gh-r' as'program'; zinit light junegunn/fzf
zinit ice if'[ "$(uname -m)" = "x86_64" ]' from'gh-r' as'program' mv'ghq* -> ghq' pick'ghq/ghq'; zinit light x-motemen/ghq
zinit light hlissner/zsh-autopair
zinit light greymd/tmux-xpanes

if [ -f ~/.p10k.zsh ]; then
  source ~/.p10k.zsh
fi

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

if [ -f ~/.zsh_abbreviations ]; then
  source ~/.zsh_abbreviations
fi

export PATH="$HOME/.local/bin:$PATH"

function cdghf {
  ghf_selected="$(ghf)"
  if [ -z "$ghf_selected" ]; then
    exit 1
  fi
  cd "$ghf_selected"
}

export EDITOR=editor
export MANPAGER='nvim +Man!'
export LESS='--mouse --raw-control-chars --wheel-lines=3 --prompt=\033[00m\033[43m \033[00m\033[33m\ue0b0\033[00m '
