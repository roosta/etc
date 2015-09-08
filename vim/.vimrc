" ┌────────────────────────────────────┐
" │░░░░░░░░░░░░░█░█░▀█▀░█▄█░░░░░░░░░░░░│
" │░░░░░░░░░░░░░▀▄▀░░█░░█░█░░░░░░░░░░░░│
" │░░░░░░░░░░░░░░▀░░▀▀▀░▀░▀░░░░░░░░░░░░│
" ├────────────────────────────────────┤
" │ Author : Roosta <mail@roosta.sh>   │
" │ Site   : http://dotfiles.roosta.sh │
" │ Github : https://github.com/roosta │
" └────────────────────────────────────┘

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" ────── Reload vim conf on save ───────
" source conf on save
"augroup reload_vimrc " {
    "autocmd!
    "autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }

" ───────────── Options ──────────────
" using EasyClip. See Plugins
"set clipboard=unnamed " set same clipboard for vim and X
"set paste

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" wildmenu
set wildmenu " command line completion
set wildmode=longest,list,full
"set wildmode=longest:full,full
set wildignorecase

set backspace=indent,eol,start " fix backspace behaviour

" interface
set timeoutlen=1000 ttimeoutlen=0 " adjust timeouts for escaping normal mode.
set laststatus=2 " Always display the statusline in all windows
set showtabline=1 " Always display the tabline, even if there is only one tab
set showcmd " show partial command in last line of screen
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set shortmess+=I " dont display startup message
set scrolloff=3
set t_Co=256 " force 256colors
set lazyredraw " stop unnecessary rendering

" Highlights
"set cc=80
set cursorline " highlight current line
set wrap " show line numbers
set number " show line numbers
set matchtime=2 " time to display matching brackets
set showmatch " show matching brackets/parenthesis

" searching
set incsearch
set ignorecase
set smartcase
set magic

" line up soft-wrap prefix with the line numbers
set showbreak=\ \ \ \ \ \ ↳\
set cpoptions+=n " show line numbers

" Indentation
set expandtab " tabs are spaces
set shiftwidth=2 " use indents of 2 spaces
set tabstop=2 " use indents of 2 spaces
set softtabstop=2 " let backspace delete indent
set smartindent
set smarttab

" searching
set hlsearch
set incsearch
set gdefault " the /g flag on :s substitutions by default
" highlight column "set cursorcolumn

" ───────────── GUI only ──────────────
if has('gui_running')
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  set guifont=Essential\ PragmataPro\ 14px
  set guiheadroom=0
endif

" ───────────── Keybinds ──────────────
" change mapleader
"let mapleader = ","

" quickly quit a buffer.
nnoremap <C-q> :bd<CR>

" press enter to exit search highlight
nnoremap <CR> :nohlsearch<CR><CR>

" access x clipboard with leader+p/y
"nnoremap <leader>y "+y
"nnoremap <leader>yy "+yy
"vnoremap <leader>y "+y
"vnoremap <leader>yy "+yy
"vnoremap <leader>p "+p
"nnoremap <leader>p "+p
"nnoremap <leader>P "+p

" ───────────── Plugins ──────────────
call plug#begin('~/.vim/plugged')

" on demand plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " filetree in vim
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " filetree in vim

" always load
Plug 'majutsushi/tagbar' " generate a sidebar with ctags
Plug 'jdonaldson/vaxe' " vim support for haxe projects
Plug 'tpope/vim-surround' " Quickly surround text
Plug 'tpope/vim-repeat' " Quickly surround text
Plug 'tpope/vim-eunuch' " add sudo access in vim.
Plug 'svermeulen/vim-easyclip' " simplyfy yank and paste
Plug 'terryma/vim-multiple-cursors' " the one feature in st I really missed
Plug 'kien/ctrlp.vim' " well, maybe this one too...
Plug 'scrooloose/nerdcommenter' " commend code qickly with syntax support
Plug 'morhetz/gruvbox' " awesome colorscheme
Plug 'scrooloose/syntastic' " lint and error checking
Plug 'sheerun/vim-polyglot' " lots more syntax
Plug 'easymotion/vim-easymotion' " move around text with new motions
Plug 'unblevable/quick-scope' " add visuals to fFtT movements
Plug 'bling/vim-airline' " statusbar
Plug 'ntpeters/vim-better-whitespace' " highlight and strip unneeded whitespace
Plug 'bling/vim-bufferline' " list buffers in statusbar
Plug 'Valloric/YouCompleteMe' " autocompletion. Conf needed

" some ..line generators
"Plug 'edkolev/promptline.vim' " a airline prompt generator for shell
Plug 'edkolev/tmuxline.vim' " an airline tmux statusbar generator

call plug#end()

filetype plugin indent on
syntax on

" ───────────── Syntastic ──────────────
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ignore_files = ['sweetline.css']

"───────── vim-multiple-cursor ─────────
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-l>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ─────────────── Ctrl-P ───────────────
map <c-b> :CtrlPBuffer<CR>
map <leader>p :CtrlPTag<CR>
let g:ctrlp_root_markers = ['project.xml', 'project.lime', '.project']
let g:ctrlp_by_filename = 1
let g:ctrlp_use_caching = 1
"let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'r'

" ───────────── NERDTree ───────────────
map <leader>n :NERDTreeToggle<CR>

" show hidden files in nerdtree
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
" close vim if nerdtree is only window remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ───────────── Easymotion ──────────────
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
map , <Plug>(easymotion-prefix)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Need one more keystroke, but on average, it may be more comfortable.
nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-s2)

" ───────────── Quickscope ─────────────
let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
let g:qs_first_occurrence_highlight_color = 155       " terminal vim

let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
let g:qs_second_occurrence_highlight_color = 81         " terminal vim

" Trigger a highlight in the appropriate direction when pressing these keys:
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" ────────────── Airline ────────────────
let g:airline_powerline_fonts = 1

" ────────────── Easyclip ───────────────

" remap mark to gm since EasyClip cut shadows m key
nnoremap gm m

imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
let g:EasyClipShareYanks = 1
set clipboard=unnamed,unnamedplus

nmap <c-f> <plug>EasyClipSwapPasteForward
nmap <c-d> <plug>EasyClipSwapPasteBackwards
"
" ─────────────── Gruvbox ────────────────
" Set theme
"colorscheme railscasts
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark " Setting dark mode

" ───────────── Bufferline ──────────────
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '+'
let g:airline#extensions#bufferline#overwrite_variables=0
let g:bufferline_active_highlight = 'StatusLine'
let g:bufferline_show_bufnr = 0
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

" ──────────────── Vaxe ─────────────────
"let g:vaxe_cache_server = 1
"let g:vaxe_prefer_lime = 1
let g:vaxe_lime_target = 'html5'
"let g:vaxe_openfl_target = 'html5'
"let g:vaxe_cache_server_autostart = 1
let g:vaxe_completion_prevent_bufwrite_events = 1
"let g:vaxe_completion_disable_optimizations = 0

" ─────────────── Tagbar ────────────────
nmap <leader>t :TagbarToggle<CR>

" ───────────── Promptline ──────────────
"let g:promptline_preset = {
  "\'a' : [ '$vim_mode' ],
  "\'b' : [ promptline#slices#cwd() ],
  "\'c' : [ promptline#slices#jobs() ],
  "\'warn' : [ promptline#slices#last_exit_code() ],
  "\'x' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
  "\'y' : [ promptline#slices#host() ],
  "\'z' : [ '$(date +%H:%M:%S)' ]}

": PromptlineSnapshot ~/.zsh/plugins/promptline.zsh airline_insert
