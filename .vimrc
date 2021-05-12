" cache directory
let s:cache_dir = '~/.cache/k07e-dotfiles2'

" look
set cursorline
set laststatus=2
set number
set showtabline=2
set noshowmode
set relativenumber
set wildmenu
set list
set listchars=eol:↵,extends:»,nbsp:%,precedes:«,tab:»-,trail:·
set nowrap

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
Plug 'tomasiser/vim-code-dark'
Plug 'axvr/photon.vim'

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
  Plug 'rafamadriz/friendly-snippets'

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
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-rsi'
Plug 'junegunn/vim-emoji'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'

" look
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'k07e/lightline-photon.vim'

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

" automatically save changes to disk
Plug '907th/vim-auto-save'

" input method
Plug 'tyru/eskk.vim'

" run shell commands in background
Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/asyncrun.extra'

" start screen
Plug 'mhinz/vim-startify'

call plug#end()

" color scheme
set background=dark
set termguicolors
colorscheme gruvbox8_hard
let g:colorscheme_id = 'gruvbox8'
let g:can_toggle_background = 1

" key mappings
let g:maplocalleader = "\<Space>"
nnoremap <silent> <Leader> :<C-u>WhichKey '<Bslash>'<CR>
vnoremap <silent> <Leader> :<C-u>WhichKeyVisual '<Bslash>'<CR>
nnoremap <silent> <LocalLeader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <LocalLeader> :<C-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <2-LeftMouse> :TranslateW<CR>

function LightlineFileTypeSymbol()
  return WebDevIconsGetFileTypeSymbol(expand('%'))
endfunction

function LightlineFileFormatSymbol()
  return &fileformat == 'unix' ? '' :
    \ &fileformat == 'dos' ? '' :
    \ &fileformat == 'mac' ? '' :
    \ &fileformat
endfunction

function LightlineTabDecleaseTabnum(n)
  return string(a:n - 1)
endfunction

let g:is_educate_mode = 0
function ToggleEducateWrapper()
  ToggleEducate
  let g:is_educate_mode = 1 - g:is_educate_mode
endfunction

" plugins settings
let g:lightline = {
  \   'active': {
  \     'left': [
  \       ['mode', 'eskk', 'autosave', 'educate', 'paste'],
  \       ['readonly', 'filename', 'modified'],
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['fileformatsymbol', 'fileencoding', 'filetypesymbol'],
  \     ],
  \   },
  \   'colorscheme': 'gruvbox8',
  \   'component': {
  \     'autosave': '%{g:auto_save ? "AUTOSAVE" : ""}',
  \     'educate': '%{g:is_educate_mode ? "EDUCATE" : ""}',
  \     'eskk': '%{eskk#is_enabled() ? eskk#statusline() : ""}',
  \   },
  \   'component_visible_condition': {
  \     'autosave': 'g:auto_save',
  \     'educate': 'g:is_educate_mode',
  \     'eskk': 'eskk#is_enabled()',
  \   },
  \   'component_function': {
  \     'fileformatsymbol': 'LightlineFileFormatSymbol',
  \     'filetypesymbol': 'LightlineFileTypeSymbol',
  \   },
  \   'mode_map': {
  \     "\<C-s>": 'S-B',
  \     "\<C-v>": 'V-B',
  \     'R': 'R',
  \     'S': 'S-L',
  \     'V': 'V-L',
  \     'c': 'C',
  \     'i': 'I',
  \     'n': 'N',
  \     's': 'S',
  \     't': 'T',
  \     'v': 'V',
  \   },
  \   'separator': { 'left': '', 'right': '' },
  \   'subseparator': { 'left': '', 'right': '' },
  \   'tab_component_function': {
  \     'tabnum': 'LightlineTabDecleaseTabnum',
  \   },
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
  \   'startify',
  \   'which_key',
  \ ]
let g:rainbow_conf = {
  \   'separately': {
  \     'floaterm': 0,
  \     'nerdtree': 0,
  \     'todo': 0,
  \   },
  \ }
let g:undotree_HighlightChangedText = 0
let g:undotree_HighlightChangedWithSign = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:eskk#large_dictionary = {
  \   'path': s:cache_dir . '/SKK-JISYO.L',
  \ }
let g:asynctasks_term_pos = 'floaterm'
let g:sneak#label = 1

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

" ref: https://github.com/itchyny/lightline.vim/issues/258#issue-271260954
function s:setLightlineColorscheme(name)
  let g:lightline.colorscheme = a:name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function Colorscheme_codedark()
  let g:colorscheme_id = g:colors_name
  let g:can_toggle_background = 0
  set background=dark
  colorscheme codedark
  call s:setLightlineColorscheme(g:colors_name)
  if $TMUX != ''
    Tmuxline lightline_insert
  endif
endfunction

function Colorscheme_gruvbox8()
  let g:colorscheme_id = 'gruvbox8'
  let g:can_toggle_background = 1
  colorscheme gruvbox8_hard
  call s:setLightlineColorscheme('gruvbox8')
  if $TMUX != ''
    Tmuxline vim_statusline_1
  endif
endfunction

function Colorscheme_photon()
  let g:colorscheme_id = 'photon'
  let g:can_toggle_background = 0
  colorscheme photon
  call s:setLightlineColorscheme('photon')
  if $TMUX != ''
    Tmuxline vim_statusline_1
  endif
endfunction

function BackgroundToggle()
  if !g:can_toggle_background
    echoerr 'this colorscheme is not support to toggle background'
    return
  endif
  if &background == 'dark'
    set background=light
  else
    set background=dark
  endif
  execute 'call Colorscheme_' . g:colorscheme_id . '()'
endfunction

function ChangeTmuxlineWhenLeave()
  set background=dark
  colorscheme gruvbox8_hard
  Tmuxline vim_statusline_1
endfunction

autocmd! VimLeavePre * call ChangeTmuxlineWhenLeave()

" Leader key mappings
let g:which_key_map = {}
let g:which_key_map.T = {
  \   'name': '+todo',
  \   'S': [':FloatermNew --autoclose=1 todo-sync', 'sync'],
  \   'U': [':FloatermNew --autoclose=1 todo-update', 'update'],
  \   'a': [':AsyncTask todo-append', 'append'],
  \ }
let g:which_key_map.c = {
  \   'name': '+colorscheme',
  \   'g': ['Colorscheme_gruvbox8()', 'gruvbox8'],
  \   'c': ['Colorscheme_codedark()', 'codedark'],
  \   'p': ['Colorscheme_photon()', 'photon'],
  \ }
let g:which_key_map.g = {
  \   'name': '+git',
  \   'L': [':AsyncRun -mode=term -pos=floaterm -position=bottomright git reflog', 'reflog'],
  \   'S': [':AsyncRun -mode=term -pos=floaterm -position=bottomright git push', 'push'],
  \   'U': [':AsyncRun -mode=term -pos=floaterm -position=bottomright git pull', 'pull'],
  \   'a': [':AsyncRun -mode=term -pos=top git add -p', 'add -p'],
  \   'c': [':Gina commit --opener=tabedit', 'commit'],
  \   'd': [':AsyncRun diff --opener=tabedit', 'diff'],
  \   'l': [':Gina log --opener=tabedit', 'log'],
  \   'r': [':AsyncRun -mode=term -pos=top git rebase -i', 'rebase -i'],
  \   's': [':Gina status --opener=tabedit', 'status'],
  \ }
let g:which_key_map.p = {
  \   'name': '+plug',
  \   't': 'Translate',
  \   'w': 'TranslateW',
  \   'r': 'TranslateR',
  \   'x': 'TranslateX',
  \ }
let g:which_key_map.r = {
  \   'name': '+repl',
  \   'b': [':FloatermNew --autoclose=2 bash', 'bash'],
  \   'f': [':FloatermNew --autoclose=2 fish', 'fish'],
  \   'n': [':FloatermNew --autoclose=2 node', 'node'],
  \   'p': [':FloatermNew --autoclose=2 python3', 'python'],
  \   'r': [':FloatermNew --autoclose=2 irb', 'ruby'],
  \   'z': [':FloatermNew --autoclose=2 zsh', 'zsh'],
  \ }
let g:which_key_map.t = {
  \   'name': '+toggle',
  \   'G': ['GitGutterToggle', 'GitGutter'],
  \   'L': ['lightline#toggle()', 'lightline'],
  \   'a': ['AutoSaveToggle', 'AutoSave'],
  \   'b': ['BackgroundToggle()', 'background'],
  \   'e': ['ToggleEducateWrapper()', 'Educate'],
  \   'g': ['Goyo', 'Goyo'],
  \   'i': ['IndentGuidesToggle', 'IndentGuides'],
  \   'l': [':Limelight!!', 'Limelight'],
  \   'n': ['NERDTreeToggle', 'NERDTree'],
  \   'p': [':set invpaste', 'paste'],
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
nnoremap <silent> [tmux-like]0 :tabnext 1<CR>
nnoremap <silent> [tmux-like]1 :tabnext 2<CR>
nnoremap <silent> [tmux-like]2 :tabnext 3<CR>
nnoremap <silent> [tmux-like]3 :tabnext 4<CR>
nnoremap <silent> [tmux-like]4 :tabnext 5<CR>
nnoremap <silent> [tmux-like]5 :tabnext 6<CR>
nnoremap <silent> [tmux-like]6 :tabnext 7<CR>
nnoremap <silent> [tmux-like]7 :tabnext 8<CR>
nnoremap <silent> [tmux-like]8 :tabnext 9<CR>
nnoremap <silent> [tmux-like]9 :tabnext 10<CR>
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

" key mappings for insert mode
inoremap <silent> jj <ESC>
inoremap <silent> ]h <C-o>h
inoremap <silent> ]j <C-o>j
inoremap <silent> ]k <C-o>k
inoremap <silent> ]l <C-o>l

for i in range(1, 999)
  execute 'inoremap <silent> ]' . i . 'h <C-o>' . i . 'h'
  execute 'inoremap <silent> ]' . i . 'j <C-o>' . i . 'j'
  execute 'inoremap <silent> ]' . i . 'k <C-o>' . i . 'k'
  execute 'inoremap <silent> ]' . i . 'l <C-o>' . i . 'l'
endfor

" enable virtual editing
set virtualedit=onemore

" Install SKK-JISYO.L if not found
if empty(glob(s:cache_dir . '/SKK-JISYO.L'))
  silent execute '!curl -fLo ' . s:cache_dir . '/SKK-JISYO.L --create-dirs http://openlab.ring.gr.jp/skk/skk/dic/SKK-JISYO.L'
endif

" for asynctasks.vim
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>

" enable undofile
set undofile
let &undodir = expand(s:cache_dir) . '/vim/undo'

" for floaterm
let g:floaterm_keymap_first = ']0'
let g:floaterm_keymap_hide = ']d'
let g:floaterm_keymap_kill = ']x'
let g:floaterm_keymap_last = ']l'
let g:floaterm_keymap_new = ']c'
let g:floaterm_keymap_next = ']n'
let g:floaterm_keymap_prev = ']p'
let g:floaterm_keymap_show = ']a'
let g:floaterm_keymap_toggle = ']y'

" for startify
function s:get_vim_info()
  return system((has('nvim') ? 'nvim' : 'vim') . ' --version | head --lines=1 | xargs echo -n')
endfunction
let g:startify_custom_header = startify#pad([s:get_vim_info()])
let g:startify_change_to_dir = 0
