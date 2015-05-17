" vundle setup
set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" haxe plugin
Plugin 'jdonaldson/vaxe'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" enable syntax
syntax on

" paste without auto indentation
set paste

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

" the /g flag on :s substitutions by default
set gdefault

" show matching brackets/parenthesis
set showmatch

" make backspace behave in a sane manner
set backspace=indent,eol,start

" disable startup message
set shortmess+=I

" enable powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2

" set color scheme
colorscheme molokai
let g:molokai_original = 1

" stop unnecessary rendering
set lazyredraw

" show line numbers
set number

" no line wrapping
set nowrap

" searching
" set hlsearch
" set incsearch

" no folding
set foldlevel=99
set foldminlines=99

" wrap long lines
set nowrap

" use indents of 2 spaces
set shiftwidth=2

" tabs are spaces, not tabs
set expandtab

" an indentation every four columns
set tabstop=2

" let backspace delete indent
set softtabstop=2

" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" make ; work like : for commands. lazy shifting
nnoremap ; :

" json pretty print
command J :%!python -mjson.tool

" enable file type detection and do language-dependent indenting
if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif

" let mapleader=","
vnoremap <silent> <leader>y :w !xsel -i -b<CR>
nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>

" remap code completion to ^space
"inoremap <Nul> <C-x><C-o>
" inoremap <Nul> <C-n>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

