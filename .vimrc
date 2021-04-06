" look
set cursorline
set laststatus=2
set number

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" load .editorconfig
Plug 'editorconfig/editorconfig-vim'

" auto close parentheses
Plug 'mattn/vim-lexiv'

" color scheme
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

" color scheme
set background=dark
set termguicolors
colorscheme gruvbox8_hard
