" vundle setup
set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'jdonaldson/vaxe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let mapleader = ","

" reload conf on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set t_Co=256
" set colorscheme monokai
colorscheme molokai
"let g:molokai_original = 1
let g:rehash256 = 1

" Multiple-cursor  mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

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

" remove delay on escape press, but still works with key combinations
set timeoutlen=1000 ttimeoutlen=0

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" stop unnecessary rendering
"set lazyredraw

" show line numbers
set number

" line wrapping
set wrap

" searching
" set hlsearch
" set incsearch

" no folding
set foldlevel=99
set foldminlines=99

" use indents of 2 spaces
set shiftwidth=4

" tabs are spaces, not tabs
set expandtab

" an indentation every four columns
set tabstop=4

" let backspace delete indent
set softtabstop=4

" remove trailing whitespaces and ^M chars
"autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" make ; work like : for commands. lazy shifting
nnoremap ; :

" show linebreak
set showbreak=↪

" json pretty print
"command J :%!python -mjson.tool

" enable file type detection and do language-dependent indenting
"if has("autocmd")
  "filetype on
  "filetype indent on
  "filetype plugin on
"endif

"imap jk <ESC>

" show leader in bottom right
set showcmd

" access x clipboard with leader+p/y
vnoremap <silent> <leader>y :w !xsel -i -b<CR>
nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>

" remap code completion to ^space
"inoremap <Nul> <C-x><C-o>
" inoremap <Nul> <C-n>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>


