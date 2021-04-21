" look
set cursorline
set laststatus=2
set number
set showtabline=2
set noshowmode
set relativenumber
set wildmenu

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
Plug 'preservim/nerdtree'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'

" look
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'

" 日本語化
Plug 'vim-jp/vimdoc-ja'

" support todo.txt
Plug 'freitass/todo.txt-vim'

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-syntax'
  Plug 'pianohacker/vim-textobj-indented-paragraph'
  Plug 'preservim/vim-textobj-quote'

call plug#end()

" color scheme
set background=dark
set termguicolors
colorscheme gruvbox8_hard

" key mappings
let g:maplocalleader = "\<Space>"
nnoremap <silent> <Leader> :<C-u>WhichKey '<Bslash>'<CR>
vnoremap <silent> <Leader> :<C-u>WhichKeyVisual '<Bslash>'<CR>
nnoremap <silent> <LocalLeader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <LocalLeader> :<C-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <2-LeftMouse> :TranslateW<CR>

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
let g:undotree_WindowLayout = 3
let g:indent_guides_exclude_filetypes = [
  \   'floaterm',
  \   'gina-status',
  \   'help',
  \   'lisp',
  \   'man',
  \   'nerdtree',
  \   'which_key',
  \ ]
let g:rainbow_conf = {
  \   'separately': {
  \     'nerdtree': 0,
  \     'todo': 0,
  \   },
  \ }
let g:undotree_HighlightChangedText = 0
let g:undotree_HighlightSyntaxAdd = 0
let g:undotree_HighlightSyntaxChange = 0

" ref: https://github.com/junegunn/limelight.vim#goyovim-integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ref: https://github.com/voldikss/vim-translator#key-mappings
" Echo translation in the cmdline
nmap <silent> <Leader>pt <Plug>Translate
vmap <silent> <Leader>pt <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>pw <Plug>TranslateW
vmap <silent> <Leader>pw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>pr <Plug>TranslateR
vmap <silent> <Leader>pr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>px <Plug>TranslateX

" 日本語ヘルプの優先順位を上げる
set helplang=ja,en

" TODO: support switching dark and light of g:lightline.colorscheme

function BackgroundDark()
  set background=dark
  Tmuxline vim_statusline_1
endfunction

function BackgroundLight()
  set background=light
  Tmuxline vim_statusline_1
endfunction

function BackgroundToggle()
  if &background == 'dark'
    call BackgroundLight()
  else
    call BackgroundDark()
  endif
endfunction

autocmd! VimLeavePre * call BackgroundDark()

" Leader key mappings
let g:which_key_map = {}
let g:which_key_map.g = {
  \   'name': '+git',
  \   'R': [':FloatermNew --autoclose=1 git rebase --continue', 'rebase --continue'],
  \   'a': [':FloatermNew --autoclose=1 git add -p', 'add -p'],
  \   'c': [':Gina commit --opener=tabedit', 'commit'],
  \   'd': [':Gina diff --opener=tabedit', 'diff'],
  \   'l': [':Gina log --opener=tabedit', 'log'],
  \   'r': [':FloatermNew --autoclose=1 git rebase -i', 'rebase -i'],
  \   's': [':Gina status --opener=tabedit', 'status'],
  \ }
let g:which_key_map.p = {
  \   'name': '+plug',
  \   't': 'Translate',
  \   'w': 'TranslateW',
  \   'r': 'TranslateR',
  \   'x': 'TranslateX',
  \ }
let g:which_key_map.t = {
  \   'name': '+toggle',
  \   'G': ['GitGutterToggle', 'GitGutter'],
  \   'L': ['lightline#toggle()', 'lightline'],
  \   'b': ['BackgroundToggle()', 'background'],
  \   'g': ['Goyo', 'Goyo'],
  \   'i': ['IndentGuidesToggle', 'IndentGuides'],
  \   'l': [':Limelight!!', 'Limelight'],
  \   'n': ['NERDTreeToggle', 'NERDTree'],
  \   'r': ['RainbowToggle', 'Rainbow'],
  \   'u': ['UndotreeToggle', 'Undotree'],
  \   'v': [':Vista!!', 'Vista'],
  \ }
call which_key#register("\<Bslash>", 'g:which_key_map')

" enable mouse
set mouse=a

" tmux-like key mappings
function TmuxLike_CloseTab()
  let l:input = input('Close tab? (y/n) ')
  if l:input == 'y'
    quit!
  endif
endfunction

nnoremap <silent> [tmux-like] <Nop>
nmap <silent> <C-k> [tmux-like]
nnoremap <silent> <C-k><C-k> <C-k>

nnoremap <silent> [tmux-like]" :belowright split<CR>
nnoremap <silent> [tmux-like]% :vertical belowright vsplit<CR>
nnoremap <silent> [tmux-like]1 :tabnext 1<CR>
nnoremap <silent> [tmux-like]2 :tabnext 2<CR>
nnoremap <silent> [tmux-like]3 :tabnext 3<CR>
nnoremap <silent> [tmux-like]4 :tabnext 4<CR>
nnoremap <silent> [tmux-like]5 :tabnext 5<CR>
nnoremap <silent> [tmux-like]6 :tabnext 6<CR>
nnoremap <silent> [tmux-like]7 :tabnext 7<CR>
nnoremap <silent> [tmux-like]8 :tabnext 8<CR>
nnoremap <silent> [tmux-like]9 :tabnext 9<CR>
nnoremap <silent> [tmux-like]<Down> <C-w><Down>
nnoremap <silent> [tmux-like]<Left> <C-w><Left>
nnoremap <silent> [tmux-like]<Right> <C-w><Right>
nnoremap <silent> [tmux-like]<Up> <C-w><Up>
nnoremap <silent> [tmux-like]c :tabedit<CR>
nnoremap <silent> [tmux-like]n :tabnext<CR>
nnoremap <silent> [tmux-like]o <C-w>w
nnoremap <silent> [tmux-like]p :tabprevious<CR>
nnoremap <silent> [tmux-like]x :call TmuxLike_CloseTab()<CR>

" key mappings for todo
autocmd FileType todo nnoremap <buffer><silent> <LocalLeader>S :FloatermNew --autoclose=1 todo-sync<CR>
autocmd FileType todo nnoremap <buffer><silent> <LocalLeader>U :FloatermNew --autoclose=1 todo-update<CR>

" reload file when changes
set autoread

" disable timeout
set notimeout
