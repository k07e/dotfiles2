let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'mattn/vim-lexiv'

call plug#end()

set background=dark
set termguicolors
colorscheme gruvbox8_hard
