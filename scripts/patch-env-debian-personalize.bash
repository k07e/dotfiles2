./start-debian.sh << end
{
  apt-fast install -y git
  git clone https://github.com/k07e/dotfiles2 ~/dotfiles
  ~/dotfiles/install.sh
  apt-fast install -y \
    curl \
    neovim \
    tmux
} </dev/tty
end
