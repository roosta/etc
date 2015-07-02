" ┌──────────────┐
" │░█░█░▀█▀░█▄█░░│
" │░▀▄▀░░█░░█░█░░│
" │░░▀░░▀▀▀░▀░▀░░│
" └──────────────┘
" Author : Roosta <roosta@dab.works>
" Site   : http://dotfiles.dab.works
" Github : https://github.com/roosta
" -------------------------------

" -------------------- 
" - Plugins
" -------------------- 

" vundle setup
set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'jdonaldson/vaxe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'otommod/conky-syntax.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set rtp+=~/.vim/static

" vim-multiple-cursor config 
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

noremap <leader>b :CtrlPBuffer<CR>

" enable powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Set theme
colorscheme railscasts

" molokai options
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1


" -------------------- 
" - scripts
" -------------------- 

" reload conf on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" -------------------- 
" - Options
" -------------------- 

" enable syntax
syntax on

" paste without auto indentation
set paste

" keep at least 3 lines above/below
set scrolloff=3

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" file name tab completion
set wildmode=longest,list,full
set wildmenu

" case insensitive search
set ignorecase
set smartcase

" show matching brackets/parenthesis
set showmatch

" make backspace behave in a sane manner
set backspace=indent,eol,start

" disable startup message
set shortmess+=I

" set 256 colors
set t_Co=256

" remove delay on escape press, but still works with key combinations
set timeoutlen=1000 ttimeoutlen=0

" Always display the statusline in all windows
set laststatus=2 

" Always display the tabline, even if there is only one tab
set showtabline=2

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode 

" stop unnecessary rendering
set lazyredraw

" show line numbers
set number

" line wrapping
set wrap

" use indents of 2 spaces
set shiftwidth=2

" tabs are spaces, not tabs
set expandtab

" an indentation every four columns
set tabstop=2

" let backspace delete indent
set softtabstop=2

" remove trailing whitespaces and ^M chars
"autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" --------------------
" - Keybinds
" -------------------- 

" change mapleader
let mapleader = ","


" make ; work like : for commands. lazy shifting
"nnoremap ; :

" show linebreak
set showbreak=↪

" access x clipboard with leader+p/y
vnoremap <silent> <leader>y :w !xsel -i -b<CR>
nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>

" -------------------- 
" - gvim options
" --------------------

if has('gui_running')
  set guioptions-=T  " no toolbar
  set lines=60 columns=108 linespace=0
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  "set guifont=Inconsolata\ for\ Powerline\ 10
endif
