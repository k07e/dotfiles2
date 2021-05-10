./start-debian.sh << end
apt-get install -y git
git clone https://github.com/k07e/dotfiles2 ~/dotfiles
~/dotfiles/install.sh
apt-get install -y \
  curl \
  neovim \
  tmux
end
