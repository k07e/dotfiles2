" look
set cursorline
set laststatus=2
set number
set showtabline=2
set noshowmode

" ref: https://github.com/vim/vim/issues/3608#issuecomment-438487463
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ref: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
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

" Language Server
Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
Plug 'liuchengxu/vista.vim'

" autocompletion
Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

" snippet
Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

" misc
Plug 'edkolev/tmuxline.vim'

" language pack
Plug 'sheerun/vim-polyglot'

" statusline/tabline
Plug 'itchyny/lightline.vim'

" enhance
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/vim-translator'
Plug 'mbbill/undotree'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'

" look
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'

" 日本語化
Plug 'vim-jp/vimdoc-ja'

call plug#end()

" color scheme
set background=dark
set termguicolors
colorscheme gruvbox8_hard

" key mappings
nnoremap <silent> <Leader> :<C-u>WhichKey '<Bslash>'<CR>
vnoremap <silent> <Leader> :<C-u>WhichKeyVisual '<Bslash>'<CR>

" plugins settings
let g:lightline = {
  \   'colorscheme': 'gruvbox8',
  \   'separator': { 'left': '', 'right': '' },
  \   'subseparator': { 'left': '', 'right': '' },
  \   'tabline_separator': { 'left': '', 'right': '' },
  \   'tabline_subseparator': { 'left': '', 'right': '' },
  \ }
let g:tmuxline_separators = {
  \   'left': '',
  \   'left_alt': '',
  \   'right': '',
  \   'right_alt': '',
  \ }
let g:rainbow_active = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:translator_target_lang = 'ja'

" ref: https://github.com/junegunn/limelight.vim#goyovim-integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ref: https://github.com/voldikss/vim-translator#key-mappings
" Echo translation in the cmdline
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>x <Plug>TranslateX

" 日本語ヘルプの優先順位を上げる
set helplang=ja,en

" Leader key mappings
let g:which_key_map = {}
let g:which_key_map.z = {
  \   'name': '+toggle',
  \   'u': ['UndotreeToggle', 'Undotree'],
  \ }
call which_key#register("\<Bslash>", 'g:which_key_map')
