"┌─────────────────────────────────────────┐
"│█▀▀▀▀▀▀▀▀▀▀▀█░░█░█░▀█▀░█▄█░░█▀▀▀▀▀▀▀▀▀▀▀█│
"│█▀▀▀▀▀▀▀▀▀▀▀█░░▀▄▀░ █ ░█ █░░█▀▀▀▀▀▀▀▀▀▀▀█│
"│█▀▀▀▀▀▀▀▀▀▀▀▀░░ ▀ ░▀▀▀░▀░▀░░▀▀▀▀▀▀▀▀▀▀▀▀█│
"│█            ░░░ ░░   ░ ░ ░░            █│
"│█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█│
"│█░░Author : Roosta <mail@roosta.sh>   ░░█│
"│█░░Site   : https://www.roosta.sh     ░░█│
"│█░░Github : https://github.com/roosta ░░█│
"└─────────────────────────────────────────┘
" Options: {{{1
""""""""""""""
if &compatible
  set nocompatible
endif

set undofile
set undodir=~/var/undo
set wildmenu
set wildmode=longest,list,full
set wildignorecase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*,
                \*/dist/*,*/undo/*,*/out/*,*/.repl*,*/.cljs_rhino_repl/*,
                \*/_site/*
set backspace=indent,eol,start
set laststatus=2
set showtabline=1
set showcmd
set shortmess+=I
set scrolloff=7
set t_Co=256
set lazyredraw
set ttyfast
set cursorline
set number
set matchtime=2
set showmatch
set relativenumber
"set hlsearch
set clipboard=unnamedplus
set shell=zsh
set spelllang=en,nb
set cm=blowfish2
set autoindent 
set smartindent

" line break
set wrap
set linebreak
set breakindent
set breakat=" ^I!@*-+;:,./?"
set cpoptions+=n  " dont show linenumbers on wrap
set showbreak=↳\

" tabs
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" search
set incsearch
" set ignorecase
set smartcase
set magic
set gdefault "substitute global flag always on

" set tags=tags;/ " search recursively up for tags
" set tags+=./.git/.tags,./tags
"}}}
" Statusline:{{{
""""""""""""""""

set showmode

" %< Where to truncate
" %n buffer number
" %F Full path
" %m Modified flag: [+], [-]
" %r Readonly flag: [RO]
" %y Type:          [vim]
" fugitive#statusline()
" %= Separator
" %-14.(...)
" %l Line
" %c Column
" %V Virtual column
" %P Percentage
" %#HighlightGroup#
set statusline=%<[%n]\ [%F]\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

"}}}
" Cursor: {{{1
"""""""""""""

" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" change cursor depending on mode (VTE compatible terminals running tmux)
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
else
" change cursor depending on mode (VTE compatible terminals)
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
endif

" Always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside
" an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
"}}}
" Gvim: {{{1
""""""""""""

if has('gui_running')
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  set guifont=Essential\ PragmataPro\ 14px
  set guiheadroom=0
  set background=dark
endif

"}}}
" Keybinds: {{{1
"""""""""""""""

set mouse=a
let mapleader = "\<SPACE>"

" source config on demand
" Note that this may cause some plugins not to load properly if it has init logic
noremap <leader>R :source $MYVIMRC<CR>

" switch between splits
noremap <silent> <leader>k       :wincmd k<CR>
noremap <silent> <leader>j       :wincmd j<CR>
noremap <silent> <leader>h       :wincmd h<CR>
noremap <silent> <leader>l       :wincmd l<CR>
noremap <silent> <leader><Up>    :wincmd k<CR>
noremap <silent> <leader><Down>  :wincmd j<CR>
noremap <silent> <leader><Left>  :wincmd h<CR>
noremap <silent> <leader><Right> :wincmd l<CR>

" Resize splits
nnoremap <silent> <M-S-Left>  10<C-w><
nnoremap <silent> <M-S-Down>  10<C-W>-
nnoremap <silent> <M-S-Up>    10<C-W>+
nnoremap <silent> <M-S-Right> 10<C-w>>
nnoremap <silent> <M-C-h>     10<C-w><
nnoremap <silent> <M-C-j>     10<C-W>-
nnoremap <silent> <M-C-k>     10<C-W>+
nnoremap <silent> <M-C-l>     10<C-w>>

" correct annoying typo
cnoremap Q q

" Make Ctrl-e jump to the end of the current line in the insert mode.
inoremap <C-e> <C-o>$

" Remove ANSI color escape codes for the edited file. This is handy when
" piping colored text into Vim.
nnoremap <Leader>rac :%s/<C-v><Esc>\[\(\d\{1,2}\(;\d\{1,2}\)\{0,2\}\)\?[m\|K]//g<CR>

" execute current python buffer.
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" }}}
" Cmd:{{{
"""""""""""""""""""""""
" https://github.com/tpope/vim-fireplace/pull/222
" command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

" if working with splits, set cursorline only on active window,
" to give an indication other than airline which split is active
augroup BgHighlight
  autocmd!
  "autocmd WinEnter * set number
  "autocmd WinLeave * set nonumber
  autocmd WinEnter * set relativenumber
  autocmd WinLeave * set number
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <leader><C-n> :call NumberToggle()<cr>

" disable 'new comment line' by removing the format option. Still happens so suspect one of my plugins...
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remove leaks for encrypted files
autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup noundofile viminfo= nobackup noshelltemp history=0 secure | endif

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
" }}}
" Vimpager: {{{
"""""""""""""""

let g:vimpager_disable_x11 = 1
let g:vimpager_scrolloff = 5
let g:vimpager_less_mode = 0
"let g:vimpager_passthrough = 0
set clipboard^=unnamed
"}}}
" Plugin Manager: {{{
"""""""""""""""""""""

" Setup plugin manager vim-plug: https://github.com/junegunn/vim-plug
" download vim-plug if not present in 'autoload'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

" TODO: http://sjl.bitbucket.org/gundo.vim/
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/YankRing.vim'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
" Plug 'unblevable/quick-scope'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mattn/emmet-vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug '~/dev/srcery'
Plug 'guns/vim-sexp'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-tbone'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jmcantrell/vim-virtualenv'


" clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }

" new
Plug 'ludovicchabant/vim-gutentags'
Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-abolish'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
" Plug 'itchyny/lightline.vim'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hdima/python-syntax'
Plug 'tmux-plugins/vim-tmux'
Plug 'vimperator/vimperator.vim'
call plug#end()

syntax on
filetype plugin indent on
"}}}
"Plugin Config: {{{1
"""""""""""""""""""

" ---------------
"  colorscheme
" --------------
colorscheme srcery

" fzf.vim
" -------
" https://github.com/junegunn/fzf.vim

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader>o  :Files<CR>
nmap <leader>bb :Buffers<cr>
nmap <leader>T  :Tags<cr>
nmap <leader>t  :BTags<cr>
nmap <leader>gc :Commits<cr>
nmap <leader>gb :BCommits<cr>
nmap <leader>gs :Gstatus<cr>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Incsearch
" ---------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map <leader>/ <Plug>(incsearch-easymotion-/)
map <leader>? <Plug>(incsearch-easymotion-?)
map <leader>g/ <Plug>(incsearch-easymotion-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Quickscope
" ----------
let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
let g:qs_first_occurrence_highlight_color = 155       " terminal vim

let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
let g:qs_second_occurrence_highlight_color = 81         " terminal vim

" Trigger a highlight in the appropriate direction when pressing these keys:
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Srcery
" ------

" -------------------
" rainbow parenthesis
" -------------------
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
"let g:rbpt_loadcmd_toggle = 0

" undotree
" --------
nnoremap <leader>ut :UndotreeToggle<cr>

" --------------------
" vim-slime
" --------------------
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

" -----------------
" vim-sexp
" -----------------
" Disable some irritating mappings
"let g:sexp_enable_insert_mode_mappings = 1

let g:sexp_mappings = {
      \ 'sexp_emit_head_element':    '<leader><Down>',
      \ 'sexp_emit_tail_element':    '<leader><Up>',
      \ 'sexp_capture_prev_element': '<leader><Left>',
      \ 'sexp_capture_next_element': '<leader><Right>',
      \}

" -----------------
" clojure_highlight
" -----------------
" This should enable Emacs like indentation
let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1

" Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def']

" ---------------
" yankring
" ---------------
nnoremap <silent> <F11> :YRShow<CR>
let g:yankring_history_dir = '~/var'
"imap <c-v> gp
"cmap <c-v> gp

" --------------------
" Tmux-navigator
" --------------------
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-Left>  : TmuxNavigateLeft<cr>
nnoremap <silent> <A-Down>  : TmuxNavigateDown<cr>
nnoremap <silent> <A-Up>    : TmuxNavigateUp<cr>
nnoremap <silent> <A-Right> : TmuxNavigateRight<cr>
nnoremap <silent> <A-\>     : TmuxNavigatePrevious<cr>

" ---------------
" emmet-vim
" ---------------
let g:user_emmet_leader_key='<C-A>'

" vsearch
" -------
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" ----------------
" easy_align
" ----------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ---------------
" python
" ---------------
let python_highlight_all = 1

" -------------------- 
" Lightline
" -------------------- 
" }}}
" vim: fdm=marker:sw=2
