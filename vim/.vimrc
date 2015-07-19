" ┌─────────────┐
" │░█░█░▀█▀░█▄█░│
" │░▀▄▀░░█░░█░█░│
" │░░▀░░▀▀▀░▀░▀░│
" └─────────────┘
" Author : Roosta <roosta@dab.works>
" Site   : http://dotfiles.dab.works
" Github : https://github.com/roosta
" -------------------------------

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" -------------------- 
" - functions
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
filetype off

" paste without auto indentation
set paste

" keep at least 3 lines above/below
set scrolloff=3

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" command line completion
set wildmenu
set wildmode=longest,list,full
"set wildmode=longest:full,full
set wildignorecase

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
set showtabline=1

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode 

" stop unnecessary rendering
set lazyredraw

" show line numbers
set number

" line wrapping
"set wrap

" show linebreak
"set showbreak=↪

" use indents of 2 spaces
set shiftwidth=2

" tabs are spaces, not tabs
set expandtab

" an indentation every four columns
set tabstop=2

" let backspace delete indent
set softtabstop=2

" searching
"set hlsearch
set incsearch

" the /g flag on :s substitutions by default
set gdefault

" highlight column
"set cursorcolumn

" --------------------
" - Keybinds
" -------------------- 

" change mapleader
let mapleader = ","

" access x clipboard with leader+p/y
vnoremap <silent> <leader>y :w !xsel -i -b<CR>
nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>u

" -------------------- 
" - Plugins
" -------------------- 


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'otommod/conky-syntax.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jdonaldson/vaxe'

call vundle#end()
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" enable powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" vim-multiple-cursor config 
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

map <leader>b :CtrlPBuffer<CR>
map <leader>t :NERDTreeToggle<CR>

" show hidden files in nerdtree
let NERDTreeShowHidden=1

" close vim if nerdtree is only window remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" -------------------- 
" - colors / visual
" -------------------- 
" Set theme
colorscheme railscasts

" -------------------- 
" - GUI options
" --------------------

if has('gui_running')
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  set guifont=Essential\ PragmataPro\ 9
endif
