" ┌─────────────┐
" │░█░█░▀█▀░█▄█░│
" │░▀▄▀░░█░░█░█░│
" │░░▀░░▀▀▀░▀░▀░│
" └─────────────┘
" Author : Roosta <mail@roosta.sh>
" Site   : http://dotfiles.roosta.sh
" Github : https://github.com/roosta
" -------------------------------

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" ==== functions ====
" ------------------- 

" source conf on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" ==== Options =====
" ------------------ 

" enable syntax
syntax on
"filetype off

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

" set  
set smartcase
set smartindent         
set smarttab

" show matching brackets/parenthesis
set showmatch

" show matching bracket for 0.2 seconds
set matchtime=2         

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

" change the way backslashes are used in search patterns
set magic               

" stop unnecessary rendering
set lazyredraw

" show typed command in status bar
set showcmd             

" show line numbers
set number

"set cc=80

" highlight cursor line
set cursorline

" line wrapping
set wrap

" line up soft-wrap prefix with the line numbers
"set showbreak=------>\  
"set showbreak=↪
set showbreak=\ \ \ \ \ \ ↳\ 

" start soft-wrap lines (and any prefix) in the line-number area
set cpoptions+=n

" use indents of 2 spaces
set shiftwidth=2

" tabs are spaces, not tabs
set expandtab

" an indentation every two columns
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

" ==== Keybinds ====
" ------------------ 

" change mapleader
"let mapleader = ","

" access x clipboard with leader+p/y
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
vnoremap <leader>y "+y
vnoremap <leader>yy "+yy
vnoremap <leader>p "+p
nnoremap <leader>p "+p
nnoremap <leader>P "+p

" ==== Plugins ====
" ----------------- 

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
Plugin 'tpope/vim-fireplace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/syntastic'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'sheerun/vim-polyglot'
Plugin 'easymotion/vim-easymotion'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jdonaldson/vaxe'

call vundle#end()
filetype plugin indent on

" ... Syntastic ...
" -----------------
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

" ... vim-multiple-cursor config ...
" ----------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ... ctrl-p ...
" --------------
map <leader>b :CtrlPBuffer<CR>

" ... nerd tree ...
" -----------------
map <leader>t :NERDTreeToggle<CR>

" show hidden files in nerdtree
let NERDTreeShowHidden=1

" close vim if nerdtree is only window remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ............... easymotion .................
" https://github.com/easymotion/vim-easymotion 
" --------------------------------------------
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

map , <Plug>(easymotion-prefix)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-s2)


" JK motions: Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)

" ... color theme ... 
" ------------------- 
" Set theme
"colorscheme railscasts
colorscheme gruvbox
set background=dark    " Setting dark mode

" ... GUI options ...
" -------------------

if has('gui_running')
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  "set lines=60 columns=108 linespace=0
  set guifont=Essential\ PragmataPro\ 12px
  set guiheadroom=0
endif

