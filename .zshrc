# Created by newuser for 5.8

# https://github.com/zdharma/zinit#option-2---manual-installation
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
zinit ice from'gh-r' as'program'; zinit light junegunn/fzf

if [ -f ~/.p10k.zsh ]; then
  source ~/.p10k.zsh
fi

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

if [ -f ~/.zsh_abbreviations ]; then
  source ~/.zsh_abbreviations
fi
