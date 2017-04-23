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
                \*/_site/*,\*/resources/public/js/*
" set wildignore+=.git,.hg,.svn,build,node_modules,undo,out,.repl*,.cljs_rhino_repl,_site
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
set spelllang=en_us,nb
set cm=blowfish2
set autoindent
set smartindent
set synmaxcol=2048

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
set ignorecase
set smartcase
set magic
set gdefault "substitute global flag always on

set tags=tags;/ " search recursively up for tags
" set tags+=./.git/.tags,./tags

" Use Unix as the standard file type
set ffs=unix,dos,mac

set foldmethod=marker

"}}}
" Statusline:{{{
""""""""""""""""

" set showmode
" set noshowmode
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
" Keybinds: {{{1
"""""""""""""""

set mouse=a

let mapleader = "\<SPACE>"
let maplocalleader = "\\"

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
map j gj
map k gk

" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" call userdefined functions..
command! White call StripTrailingWhitespace()<cr>
command! Mode call AppendModeline()

" switch to last buffer used.
nnoremap <leader><tab> :b#<cr>

" uses the Ilist function from qlist.
nnoremap <leader>i :Ilist<space>

imap <C-v> <Esc>"*pa

" plugin spesific
nmap <leader>cc :Dispatch<cr>
nmap <leader>o  :Files<CR>
nmap <leader>bb :Buffers<cr>
nmap <leader>T  :Tags<cr>
nmap <leader>t  :BTags<cr>
nmap <leader>gC :Commits<cr>
nmap <leader>gc :BCommits<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>m  :Marks<cr>
nmap <leader>H  :Helptags<cr>

" }}}
" Cmd:{{{
""""""""""

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
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
"
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
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
call plug#end()

syntax on
filetype plugin indent on
"}}}
"Plugin Config: {{{1

" ---------------
"  colorscheme
" --------------
" colorscheme srcery

" ---------
" Incsearch
" ---------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" -------
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

" }}}
" vim: fdm=marker:sw=2
