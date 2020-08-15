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
" General {{{

" No startup message
set shortmess+=I

" keep 7 lines visible lines above/below when scrolling up/down
set scrolloff=7

" Do not redraw screen in the middle of a macro. Makes them complete faster.
set lazyredraw

" show cursor line
set cursorline

" limit highlighting to lines shorter than 2048 chars.  useful if opening, say
" a minified js file, where the lines are extremely long
set synmaxcol=2048

"}}}
" Swap: {{{
" Increase how often swap file is written (milliseconds)
set updatetime=100
set directory=~/.cache/vim/swap//

"}}}
" Undo {{{2

set undofile
set undodir=~/.cache/vim/undo

"}}}
" Wildmenu: {{{2

set wildmenu
set wildmode=longest,list,full
set wildignorecase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*,
                \*/dist/*,*/undo/*,*/out/*,*/.repl*,*/.cljs_rhino_repl/*,
                \*/_site/*,\*/resources/public/js/*
" set wildignore+=.git,.hg,.svn,build,node_modules,undo,out,.repl*,.cljs_rhino_repl,_site

"}}}
" Indenting: {{{

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set autoindent
set smartindent

"}}}
" Tabs: {{{

" show tabline when at least two tab pages
set showtabline=1

" }}}
" Search: {{{

set incsearch
set ignorecase
set smartcase
set magic

"set hlsearch
"substitute global flag always on
" set gdefault

"}}}
" Linebreak: {{{

" wrap long lines
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

"}}}
" Line numbers {{{

" Relative line numbers start counting from the position of the cursor, making
" commands like 10j easier to spot without having to do math
set relativenumber
" set number

" }}}
" Matching surrounds {{{

set matchtime=2
set showmatch

"}}}
" Clipboard {{{

" Use xorg clipboard, makes pasting less painfull by not having to refer to
" register. I also use nvim-miniyank to traverse clipboard history
set clipboard=unnamedplus

" }}}
" Encoding {{{

set encoding=utf-8
scriptencoding utf-8

" }}}
" Spelling {{{

set spelllang=en_us,nb

"}}}
" Tags: {{{

" search recursively up for tags
set tags=tags;/

"}}}
" Folding {{{

" Default to marker folding
set foldmethod=marker

"}}}
" Undercurl: {{{
" let &t_Cs = "\e[4:3m"
" let &t_Ce = "\e[4:0m"
"}}}
" Backup {{{
" set backup
" set writebackup
set backupdir=$HOME/.cache/vim/backup
"}}}
"}}}
" Environments {{{1
" Vim: {{{2

if !has('nvim')

  " set cryptmethod=blowfish2
  set ttymouse=xterm2

  " remove leaks for encrypted files
  " augroup vimrc
  "   autocmd!
  "   autocmd BufReadPost *
  "         \ if &key != "" |
  "         \   set noswapfile nowritebackup noundofile viminfo= nobackup noshelltemp history=0 secure |
  "         \ endif
  " augroup END

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
  set termguicolors
  " set t_Co=256
endif
"}}}
" Gvim: {{{2

if has('gui_running')
  "set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=m  " remove menubar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
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
  set notermguicolors
endif

"}}}
"}}}
" Statusline:{{{

" always show statusline
set laststatus=2

" Don't disple mode in command buffer, taken care of by lightline
set noshowmode

" show the command being typed on the statusline
set showcmd

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

" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" change cursor depending on mode (VTE compatible terminals)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"}}}
" Keybinds: {{{1

set mouse=a

let g:mapleader = "\<SPACE>"
let g:maplocalleader = "\\"

" source config on demand
" Note that this may cause some plugins not to load properly if it has init logic
noremap <leader>R :source $MYVIMRC<CR>

" correct annoying typo
cnoremap Q q

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Remove search hl
noremap <silent> <leader>sc :nohlsearch<CR>

" switch to last buffer used.
nnoremap <leader><tab> :b#<cr>

" yank to end of line when pressing Y
nnoremap Y y$

" Quick way of opening Ilist
nnoremap <leader>jl :Ilist<space>

" Insert date
map <leader>D :put =strftime('# %a %Y-%m-%d %H:%M:%S%z')<CR>

" }}}
" Cmd:{{{

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
command! Mode call AppendModeline()

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
" Plugin Manager: {{{1
" PLUG BEGIN: {{{2
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
"}}}
" General: {{{
Plug 'tpope/vim-sensible'                                                    " Sensible defaults
"}}}
" Editing {{{2

Plug 'christoomey/vim-sort-motion'                                           " Sort various things using motions
Plug 'farmergreg/vim-lastplace'                                              " Save cursor position
Plug 'jiangmiao/auto-pairs'                                                  " Insert or delete brackets, parens, quotes in pair
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " Alignment
Plug 'ntpeters/vim-better-whitespace'                                        " Highlight and handle trailing whitespace
Plug 'tpope/vim-commentary'                                                  " Comments
Plug 'tpope/vim-repeat'                                                      " Add repeat support to various plugins
Plug 'tpope/vim-rsi'                                                         " Readline bindings
Plug 'tpope/vim-speeddating'                                                 " Easier dates
Plug 'tpope/vim-surround'                                                    " Surround text easily
Plug 'tpope/vim-unimpaired'                                                  " Handy bracket mappings
Plug 'wellle/targets.vim'                                                    " More text objects
Plug 'mbbill/undotree'                                                       " Tree of undo changes, use :UndotreeToggle

"}}}
" System: {{{
Plug 'tpope/vim-eunuch'     " Unix helper commands
Plug 'lambdalisue/suda.vim' " Assist in writing system files with sudo @ neovim
Plug 'tpope/vim-dispatch'   " Asynchronous build and test dispatcher
"}}}
" Quick fix {{{2
" Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
"}}}
" Note taking {{{2
Plug 'jceb/vim-orgmode'
" Plug 'vimwiki/vimwiki'
Plug 'vuciv/vim-bujo'
"}}}
" Files: {{{2
" Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-vinegar'
Plug 'trapd00r/vim-syntax-vidir-ls'
"}}}
" Search/replace: {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'rking/ag.vim'
" Plug 'mileszs/ack.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-abolish'
"}}}
" Visual: {{{2
Plug 'terryma/vim-expand-region'
"}}}
" Movement {{{2
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
"}}}
" Tags: {{{2
Plug 'ludovicchabant/vim-gutentags'
"}}}
" Completion: {{{2
" Plug 'ajh17/VimCompletesMe'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'prabirshrestha/asyncomplete.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'clojure-vim/async-clj-omni'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"}}}
" Theme: {{{2
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
Plug '/home/roosta/src/srcery-vim'
" Plug 'srcery-colors/srcery-vim'
" Plug 'sjl/badwolf'
" Plug 'romainl/flattened'
" Plug 'morhetz/gruvbox'
" Plug 'gruvbox-community/gruvbox'
"}}}
" Git: {{{2
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
"}}}
" Multiplexer: {{{2
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-tbone'
"}}}
" Web {{{2
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
" Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
"}}}
" Python: {{{2
Plug 'jmcantrell/vim-virtualenv'
"}}}
" Lisp: {{{2
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'liquidz/vim-iced', {'for': 'clojure'}
" Plug 'liquidz/vim-iced-asyncomplete', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'Olical/conjure', {'tag': 'v3.4.0'}

"}}}
" Projects {{{2
Plug 'tpope/vim-projectionist'
"}}}
" Syntax {{{2
Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'hdima/python-syntax'
Plug 'tmux-plugins/vim-tmux'
Plug 'sudar/vim-arduino-syntax'
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'gregjurman/vim-nc'
Plug 'vim-scripts/nginx.vim'
"}}}
" Linting {{{2
Plug 'w0rp/ale'
"}}}
" Rust {{{2
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
"}}}
" Documentation {{{2
" Plug 'alx741/vinfo'
"}}}
" Clipboard: {{{2
Plug 'bfredl/nvim-miniyank'
"}}}
" Snippets: {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}
" Markdown: {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
" Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"}}}
" Color: {{{
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" }}}
" PLUG END: {{{2
call plug#end()
syntax on
filetype plugin indent on
"}}}
"}}}
" Plugin Config: {{{1
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
nnoremap <leader>m  :Marks<cr>
nnoremap <leader>H  :Helptags<cr>
nnoremap <leader>/  :Ag<cr>
nnoremap <leader><leader> :Commands<cr>
nnoremap <leader>ss :BLines<cr>
nnoremap <leader>ji :BTags<cr>

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

" Vim Spelling Suggestions with fzf
" https://coreyja.com/vim-spelling-suggestions-fzf/
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

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

" map <Leader> <Plug>(easymotion-prefix)
" map <leader>jj <Plug>(easymotion-s)

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

" let g:sexp_mappings = {
"       \ 'sexp_emit_head_element':    '<leader><Down>',
"       \ 'sexp_emit_tail_element':    '<leader><Up>',
"       \ 'sexp_capture_prev_element': '<',
"       \ 'sexp_capture_next_element': '>',
"       \}
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
let g:gutentags_ctags_exclude = ['.password-store', 'node_modules', '.git', 'plugins', 'plugged']

" Move tag files to cache dir
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

let g:gutentags_exclude_project_root = ['/etc', 'usr/local']

" command to clear the cache quickly
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

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
      \   'cocstatus': 'coc#status'
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"🔒":""}',
      \ }}
"}}}
" Dispatch: {{{

" nnoremap <leader>cc :Dispatch<cr>

" }}}
" Better whitespace: {{{

let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'help', 'nofile', 'git']

" }}}
" ale: {{{
" https://github.com/borkdude/clj-kondo/blob/master/doc/editor-integration.md#vim--neovim
let g:ale_linters = {
      \ 'clojure': ['clj-kondo']
      \}
" }}}
" Deoplete: {{{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}
" fireplace: {{{
" let g:fireplace_cljs_repl = "(do (require 'figwheel-sidecar.repl-api) ((resolve 'figwheel-sidecar.repl-api/cljs-repl)))"
" }}}
" git {{{
nnoremap <leader>gs :Git<cr>
autocmd FileType gitcommit setlocal nofoldenable
" }}}
" ultisnips {{{
let g:UltiSnipsExpandTrigger="<c-;>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
" netrw {{{

" Change default netrw liststyle
" let g:netrw_liststyle = 1

map <C-i> <Plug>(NetrwHideEdit)

" https://gist.github.com/mhanberg/dd9377163be770930e6eedb81b2fe61e
" Remove C-l binding from netrw, conflicts with nav commands
augroup vimrc
  autocmd!
  autocmd FileType netrw call s:RemoveNetrwMap()
augroup END

function s:RemoveNetrwMap()
  if hasmapto('<Plug>NetrwRefresh')
    unmap <buffer> <C-l>
  endif
endfunction
"}}}
" Rust: {{{
" let g:rustfmt_autosave = 1
"}}}
" Markdown: {{{

" Markdown preview
let g:mkdp_browser = 'google-chrome-unstable'
let g:mkdp_auto_close = 0

" Conceal
set conceallevel=2
let g:vim_markdown_conceal_code_blocks = 0

let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_fenced_languages = ['bash=sh', 'js=javascript']

"}}}
" auto-pairs: {{{
" Fix for 'å' button on Norwegian keyboards
let g:AutoPairsShortcutFastWrap=''
"}}}
" Bujo: {{{
nmap <C-return> <Plug>BujoAddnormal
imap <C-return> <Plug>BujoAddinsert
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert
"}}}
" Hexokinase: {{{2
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\ ]
" }}}
"}}}
" vim: fdm=marker:sw=2
