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
" OPTIONS {{{1
" ------------
" must be first, because it changes other options as a side effect
if &compatible
  set nocompatible
endif

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo

" wild*
set wildmenu                   " give menu on completion
set wildmode=longest,list,full " define wildmode appearance
set wildignorecase             " ignore case on completion

" define various ignored folders when using fzf/ctrlp/whatever else uses
" wildmode
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*,
                \*/dist/*,*/undo/*,*/out/*,*/.repl*,*/.cljs_rhino_repl/*,
                \*/_site/*

" fix backspace behaviour
set backspace=indent,eol,start

" interface
"set timeoutlen=1000 ttimeoutlen=0 " adjust timeouts for escaping normal mode.
set laststatus=2   " Always display the statusline in all windows
set showtabline=1  " Always display the tabline, even if there is only one tab
set showcmd        " show partial command in last line of screen
set showmode       " show current mode below status line
set shortmess+=I   " dont display startup message
set scrolloff=7    "	Minimal number of screen lines to keep above and below the cursor.
set t_Co=256       " force 256colors
set lazyredraw     " stop unnecessary rendering
set ttyfast        " improve drawing in tmux

" Highlights
set cursorline     " highlight current line
set number         " show line numbers
set matchtime=2    " time to display matching brackets
set showmatch      " show matching brackets/parenthesis
set relativenumber " use relative line numbers. See functions for quick switch back to normal
"set hlsearch

" linewrap
set wrap                     " wrap long lines.
set linebreak                " break on chars defined in 'breakat'
set breakindent              " match indent on break
set breakat=" ^I!@*-+;:,./?" " define symbols that create a 'natural' line break
set cpoptions+=n             " dont show linenumbers on wrap

" break character symbol
set showbreak=↳\

" Indentation
set expandtab      " tabs are spaces
set shiftwidth=2   " use indents of 2 spaces
set tabstop=2      " use indents of 2 spaces
set softtabstop=2  " let backspace delete indent

" SEARCHING
set incsearch      " match while typing
set smartcase
set magic          " :help magic
set gdefault       " the /g flag on :s substitutions by default

set mouse=a        " enable mouse

set tags+=./.git/.tags,./tags

" use system clipboard
set clipboard=unnamedplus

set shell=zsh

" spellchecking
set spelllang=en,nb

set cm=blowfish2

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
set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P

" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

"}}}
" CURSOR {{{1
" -----------
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
" GVIM {{{1
" ----------
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
" KEYBINDS/KEYBINDS {{{1
" -------------
let mapleader = "\<SPACE>"

" source config on demand
" Note that this may cause some plugins not to load properly if it has init logic
noremap <leader>R :source $MYVIMRC<CR>

" switch between splits
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>l :wincmd l<CR>
noremap <silent> <leader><Up>    :wincmd k<CR>
noremap <silent> <leader><Down>  :wincmd j<CR>
noremap <silent> <leader><Left>  :wincmd h<CR>
noremap <silent> <leader><Right> :wincmd l<CR>

" Resize splits
nnoremap <silent> <M-S-Left>  10<C-w><
nnoremap <silent> <M-S-Down>  10<C-W>-
nnoremap <silent> <M-S-Up>    10<C-W>+
nnoremap <silent> <M-S-Right> 10<C-w>>
nnoremap <silent> <M-C-h> 10<C-w><
nnoremap <silent> <M-C-j> 10<C-W>-
nnoremap <silent> <M-C-k> 10<C-W>+
nnoremap <silent> <M-C-l> 10<C-w>>

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
" FUNCTIONS/AUTOCMD {{{
" ---------------------
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

" attempt to close quickfix when deleting buffer
"nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
"cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

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
" VIMPAGER {{{
" ------------
let g:vimpager_disable_x11 = 1
let g:vimpager_scrolloff = 5
let g:vimpager_less_mode = 0
"let g:vimpager_passthrough = 0
set clipboard^=unnamed
"}}}
" PLUGIN MANAGER {{{
" -------------------
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
Plug 'unblevable/quick-scope'
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
"PLUGIN CONFIG {{{1
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
" Set theme
let g:srcery_italicize_comments = 0
let g:srcery_italic = 0

"let g:srcery_contrast_dark = "hard"
set background=dark

colorscheme srcery

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

" python
" ------
let python_highlight_all = 1
" }}}
" vim: fdm=marker:sw=2
