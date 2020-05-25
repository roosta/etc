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

" use undo file and define location
set undofile
set undodir=~/var/vim/undo

" wildmenu
set wildmenu
set wildmode=longest,list,full
set wildignorecase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*,
                \*/dist/*,*/undo/*,*/out/*,*/.repl*,*/.cljs_rhino_repl/*,
                \*/_site/*,\*/resources/public/js/*
" set wildignore+=.git,.hg,.svn,build,node_modules,undo,out,.repl*,.cljs_rhino_repl,_site

set backspace=indent,eol,start

" always show statusline
set laststatus=2

" show tabline when at least two tab pages
set showtabline=1

" show the command being typed on the statusline
set showcmd

" No startup message
set shortmess+=I

" keep 7 lines visible lines above/below when scrolling up/down
set scrolloff=7

" tmp workaround for undercurl fallback to work
" https://github.com/vim/vim/issues/2424
set t_Cs=

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
set spelllang=en_us,nb
set autoindent
set smartindent

" limit highlighting to lines shorter than 2048 chars.  useful if opening, say
" a minified js file, where the lines are extremely long
set synmaxcol=2048

" line break
set wrap
" wrap long lines at a character in 'breakat'
set linebreak

" define what characters cause a linebreak
set breakat=" ^I!@*-+;:,./?"

" Every wrapped line will continue visually indented (same amount of
" space as the beginning of that line)
set breakindent

" dont show linenumbers on wrap
set cpoptions+=n

" set custom character on linebreaks caused by wrap
set showbreak=>\

" tabs
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" search
set incsearch
set ignorecase
set smartcase
set magic

"substitute global flag always on
" set gdefault

set tags=tags;/ " search recursively up for tags
" set tags+=./.git/.tags,./tags

" Use Unix as the standard file type
set fileformats=unix,dos,mac

set foldmethod=marker

set encoding=utf-8
scriptencoding utf-8

" Reduce update time to 100 milliseconds
set updatetime=100
"}}}
" Environments {{{1
" Vim: {{{2
if !has('nvim')
  set cryptmethod=blowfish2
  set ttymouse=xterm2

  " remove leaks for encrypted files
  augroup vimrc
    autocmd!
    autocmd BufReadPost *
          \ if &key != "" |
          \   set noswapfile nowritebackup noundofile viminfo= nobackup noshelltemp history=0 secure |
          \ endif
  augroup END

endif

"}}}
" Neovim: {{{2
if has('nvim')
  " tnoremap <Esc> <C-\><C-n>
endif
"}}}
" Terminal: {{{2
" set number of colors to 256
if !has('gui_running')
  set t_Co=256
endif
"}}}
" Gvim: {{{2

if has('gui_running')
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  " set guifont=Essential\ PragmataPro\ 14px
  set guiheadroom=0
  set background=dark
  set guifont=Iosevka\ 9
endif

"}}}
" Vimpager: {{{2
" Options for newer version of vimpager >= 2.06
" let g:vimpager = {}
" let g:less     = {}
" let g:less.enabled = 0
" let g:vimpager.passthrough = 0

" options for older versions <= 2.06
let g:vimpager_passthrough = 0

" Hack to disable less for vimpager version 2.06, since it doesn't support
" disabling it via a variable
if exists("vimpager")
  call <SNR>1_ToggleLess()
endif

"}}}
"}}}
" Statusline:{{{

" set showmode
set noshowmode
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
set statusline=
set statusline+=%<[%n]\
set statusline+=[%F]\
set statusline+=%m
set statusline+=%r
set statusline+=%y\
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}\
set statusline+=%{HasPaste()}\
set statusline+=%=
set statusline+=%-10.(%l,%c%V%)\
set statusline+=%P
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}]\  "file encoding
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

"}}}
" Cursor: {{{1

" Check vim version to ensure that the options we're trying to set is
" available
if v:version > 704 || v:version == 704 && has('patch687')
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
endif

"}}}
" Keybinds: {{{1

set mouse=a

let g:mapleader = "\<SPACE>"
let g:maplocalleader = "\\"

" source config on demand
" Note that this may cause some plugins not to load properly if it has init logic
noremap <leader>R :source $MYVIMRC<CR>

" switch between splits
noremap <silent> <leader>wk       :wincmd k<CR>
noremap <silent> <leader>wj       :wincmd j<CR>
noremap <silent> <leader>wh       :wincmd h<CR>
noremap <silent> <leader>wl       :wincmd l<CR>
noremap <silent> <leader>w<Up>    :wincmd k<CR>
noremap <silent> <leader>w<Down>  :wincmd j<CR>
noremap <silent> <leader>w<Left>  :wincmd h<CR>
noremap <silent> <leader>w<Right> :wincmd l<CR>

noremap <silent> <leader>w/ :vsplit<CR>
noremap <silent> <leader>w- :split<CR>

noremap <silent> <leader>sc :nohlsearch<CR>

" noremap <silent> <M-Up>    :wincmd k<CR>
" noremap <silent> <M-Down>  :wincmd j<CR>
" noremap <silent> <M-Left>  :wincmd h<CR>
" noremap <silent> <M-Right> :wincmd l<CR>

" Resize splits
" nnoremap <silent> <M-S-Left>  10<C-w><
" nnoremap <silent> <M-S-Down>  10<C-W>-
" nnoremap <silent> <M-S-Up>    10<C-W>+
" nnoremap <silent> <M-S-Right> 10<C-w>>

nnoremap <silent> <M-S-h>  10<C-w><
nnoremap <silent> <M-S-l>  10<C-W>-
nnoremap <silent> <M-S-k>  10<C-W>+
nnoremap <silent> <M-S-l>  10<C-w>>
" nnoremap <silent> <M-S-h>     10<C-w><
" nnoremap <silent> <M-S-j>     10<C-W>-
" nnoremap <silent> <M-S-k>     10<C-W>+
" nnoremap <silent> <M-S-l>     10<C-w>>

" correct annoying typo
cnoremap Q q

" Make Ctrl-e jump to the end of the current line in the insert mode.
inoremap <C-e> <C-o>$

" Remove ANSI color escape codes for the edited file. This is handy when
" piping colored text into Vim.
nnoremap <Leader>rac :%s/<C-v><Esc>\[\(\d\{1,2}\(;\d\{1,2}\)\{0,2\}\)\?[m\|K]//g<CR>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" call userdefined functions..
command! Mode call AppendModeline()

" switch to last buffer used.
nnoremap <leader><tab> :b#<cr>

" uses the Ilist function from qlist.
nnoremap <leader>ji :Ilist<space>

" imap <C-v> <Esc>"*pa

" map spell checking
nnoremap <leader>Sc z=

" yank to end of line when pressing Y
nnoremap Y y$
" }}}
" Cmd:{{{

" https://github.com/tpope/vim-fireplace/pull/222
" https://github.com/bhauman/lein-figwheel/wiki/Using-the-Figwheel-REPL-with-Vim
command! Figwheel :Piggieback (figwheel-sidecar.repl-api/repl-env)<cr>

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
nnoremap <leader><C-n> :call RelativeLinumToggle()<cr>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d fdm=marker %set :',
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
  call append(line('$'), l:modeline)
endfunction

function! UpdateAndExit()
     :PlugUpdate
     :q
     :q
endfunction

function! InstallAndExit()
     :PlugInstall
     :q
     :q
endfunction

" Here's a (what should be a one-line) map to help you tell just what syntax
" highlighting groups the item under the cursor actually is:
" Source: http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"
" }}}
" Plugin Manager: {{{

" Setup plugin manager vim-plug: https://github.com/junegunn/vim-plug
" download vim-plug if not present in 'autoload'
augroup vimrc
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
augroup END
call plug#begin('~/.vim/plugged')

" TODO: http://sjl.bitbucket.org/gundo.vim/
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'

Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'laher/fuzzymenu.vim'
" Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'wellle/targets.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'ajh17/VimCompletesMe'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
" Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-abolish'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
Plug 'markonm/traces.vim'
Plug 'ntpeters/vim-better-whitespace'

" theme
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
Plug '/home/roosta/src/srcery-vim'
" Plug 'srcery-colors/srcery-vim'
" Plug 'sjl/badwolf'
" Plug 'romainl/flattened'
" Plug 'morhetz/gruvbox'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" multiplexer
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-tbone'

" html/js/css
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }

" Python
Plug 'jmcantrell/vim-virtualenv'

" Lisp
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'liquidz/vim-iced', {'for': 'clojure'}
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'tpope/vim-salve', { 'for': 'clojure' }
" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'kien/rainbow_parentheses.vim'

Plug 'tpope/vim-projectionist'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'hdima/python-syntax'
Plug 'tmux-plugins/vim-tmux'
Plug 'sudar/vim-arduino-syntax'
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'gregjurman/vim-nc'
"
Plug 'vim-scripts/nginx.vim'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" Utils
Plug 'alx741/vinfo'
Plug 'trapd00r/vim-syntax-vidir-ls'

Plug 'farmergreg/vim-lastplace'

" Clipboard
Plug 'bfredl/nvim-miniyank'

call plug#end()

syntax on
filetype plugin indent on
"}}}
"Plugin Config: {{{1
"  Colorscheme: {{{2
" --------------
let g:srcery_dim_lisp_paren=1
let g:srcery_italic=1
" let g:srcery_inverse_matches=1
let g:srcery_transparent_background=1

colorscheme srcery
"}}}
" Fzf: {{{2
" -------
" https://github.com/junegunn/fzf.vim

" Mapping selecting mappings
nmap <leader>? <plug>(fzf-maps-n)
xmap <leader>? <plug>(fzf-maps-x)
omap <leader>? <plug>(fzf-maps-o)

nnoremap <leader>oo  :Files<CR>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>T  :Tags<cr>
nnoremap <leader>t  :BTags<cr>
nnoremap <leader>gC :Commits<cr>
nnoremap <leader>gc :BCommits<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>m  :Marks<cr>
nnoremap <leader>H  :Helptags<cr>
nnoremap <leader>/  :Ag<cr>
" nnoremap <leader><leader> :Commands<cr>
nnoremap <leader>ss :BLines<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"}}}
" Incsearch: {{{2
" ---------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 0
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"}}}
"  Easymotion: {{{2
" -------------
let g:EasyMotion_smartcase = 1

map <Leader> <Plug>(easymotion-prefix)
" map <leader><leader> <Plug>(easymotion-s2)
map <leader>jj <Plug>(easymotion-s)
" map <Leader>f <Plug>(easymotion-lineforward)
" map <Leader>F <Plug>(easymotion-linebackward)
"
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_startofline = 1 " keep cursor column when JK motion
"}}}
" Rainbow Parenthesis: {{{2
" -------------------
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" Junegunn
" https://github.com/junegunn/rainbow_parentheses.vim
" au VimEnter * RainbowParentheses
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" exclude bright black since its barly visible
" let g:rainbow#blacklist = [8]
"}}}
" Undotree: {{{2
" --------
nnoremap <leader>ut :UndotreeToggle<cr>
"}}}
" Slime: {{{2
" -------------
let g:slime_target = 'tmux'
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '2'}
let g:slime_paste_file = '$HOME/.slime_paste'
let g:slime_python_ipython = 1
"}}}
" Sexp: {{{2
" -----------------
" Disable some irritating mappings
"let g:sexp_enable_insert_mode_mappings = 1

let g:sexp_mappings = {
      \ 'sexp_emit_head_element':    '<leader><Down>',
      \ 'sexp_emit_tail_element':    '<leader><Up>',
      \ 'sexp_capture_prev_element': '<',
      \ 'sexp_capture_next_element': '>',
      \}
"}}}
" Clojure Highlight: {{{2
" -----------------
" This should enable Emacs like indentation
let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1

" Add some words which should be indented like defn etc: Compojure/compojure-api, midje and schema stuff mostly.
let g:clojure_fuzzy_indent_patterns=['^GET', '^POST', '^PUT', '^DELETE', '^ANY', '^HEAD', '^PATCH', '^OPTIONS', '^def']
"}}}
" nvim-miniyank: {{{2
" ---------------
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <c-p> <Plug>(miniyank-cycle)
map <c-n> <Plug>(miniyank-cycleback)
"}}}
" Tmux Navigator: {{{2
" --------------------
let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <A-Left>  : TmuxNavigateLeft<cr>
" nnoremap <silent> <A-Down>  : TmuxNavigateDown<cr>
" nnoremap <silent> <A-Up>    : TmuxNavigateUp<cr>
" nnoremap <silent> <A-Right> : TmuxNavigateRight<cr>
" nnoremap <silent> <A-\>     : TmuxNavigatePrevious<cr>

nnoremap <silent> <C-h>  : TmuxNavigateLeft<cr>
nnoremap <silent> <C-j>  : TmuxNavigateDown<cr>
nnoremap <silent> <C-k>  : TmuxNavigateUp<cr>
nnoremap <silent> <C-l>  : TmuxNavigateRight<cr>
" Emmet: {{{2
" ---------------
let g:user_emmet_leader_key='<C-A>'
"}}}
" Vsearch: {{{2
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

" Easy-align: {{{2
" ----------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
" Python: {{{2
" ---------------
let g:python_highlight_all = 1

"}}}
" Gutentags: {{{2
" --------------------
let g:gutentags_ctags_exclude = ['.password-store, node_modules', '.git', 'plugins', 'plugged']
"}}}
" Ack: {{{2
" ----------
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'
"}}}
" Lightline: {{{2
" --------------
let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ }}
"}}}
" Dispatch: {{{

nnoremap <leader>cc :Dispatch<cr>

" }}}
" Better whitespace: {{{

let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'help', 'nofile', 'git']

" }}}
" Fuzzymenu {{{
nmap <Leader><Leader> <Plug>Fzm
vmap <Leader><Leader> <Plug>FzmVisual
"}}}
" vim-iced {{{2
let g:iced_enable_default_key_mappings = v:true
"}}}
" vim: fdm=marker:sw=2

