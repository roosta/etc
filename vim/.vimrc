" ┌────────────────────────────────────┐
" │░░░░░░░░░░░░░█░█░▀█▀░█▄█░░░░░░░░░░░░│
" │░░░░░░░░░░░░░▀▄▀░░█░░█░█░░░░░░░░░░░░│
" │░░░░░░░░░░░░░░▀░░▀▀▀░▀░▀░░░░░░░░░░░░│
" ├────────────────────────────────────┤
" │ Author : Roosta <mail@roosta.sh>   │
" │ Site   : http://dotfiles.roosta.sh │
" │ Github : https://github.com/roosta │
" └────────────────────────────────────┘
" souces:
" - http://amix.dk/vim/vimrc.html
" - https://github.com/xero/dotfiles/tree/master/vim
" - https://github.com/trapd00r/configs/tree/master/vim
" ──────────────────────────────────────

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" ───────────── OPTIONS ──────────────
" ────────────────────────────────────
" using EasyClip. See Plugins
"set clipboard=unnamed " set same clipboard for vim and X
"set paste

set autowrite

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" wildmenu
set wildmenu " command line completion
set wildmode=longest,list,full
"set wildmode=longest:full,full
set wildignorecase

" fix backspace behaviour
set backspace=indent,eol,start

" interface
set timeoutlen=1000 ttimeoutlen=0 " adjust timeouts for escaping normal mode.
set laststatus=2 " Always display the statusline in all windows
set showtabline=1 " Always display the tabline, even if there is only one tab
set showcmd " show partial command in last line of screen
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set shortmess+=I " dont display startup message
set scrolloff=7
set t_Co=256 " force 256colors
set lazyredraw " stop unnecessary rendering

" Highlights
"set cc=80 " column hightlighting
" highlight column "set cursorcolumn
set cursorline " highlight current line
set wrap " show line numbers
set number " show line numbers
set matchtime=2 " time to display matching brackets
set showmatch " show matching brackets/parenthesis

" line up soft-wrap prefix with the line numbers
set showbreak=\ \ \ \ \ \ ↳\
set cpoptions+=n " show line numbers

" Indentation
set expandtab " tabs are spaces
set shiftwidth=2 " use indents of 2 spaces
set tabstop=2 " use indents of 2 spaces
set softtabstop=2 " let backspace delete indent
"set smartindent
"set smarttab

" searching
"set hlsearch
set incsearch
set ignorecase
set smartcase
set magic
set gdefault " the /g flag on :s substitutions by default

" Tags
"set tags+=tags " look for tag file at ./[here]

" change cursor depending on mode (VTE compatible terminals)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" ───────────── GUI ONLY ──────────────
" ─────────────────────────────────────
if has('gui_running')
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  set guifont=Essential\ PragmataPro\ 14px
  set guiheadroom=0
endif

" ───────────── KEYBINDS ──────────────
" ────────────────────────────────────
" Move across wrapped lines like regular lines
noremap 0 ^ " Go to the first non-blank character of a line
noremap ^ 0 " Just in case you need to go to the very beginning of a line

" source config on deman
noremap <c-w>r :source $MYVIMRC<CR>

" Close all the buffers
map <leader>ba :%bdelete<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" ───────────── PLUGINS ──────────────
" ────────────────────────────────────
call plug#begin('~/.vim/plugged')

" on demand plugins
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " filetree in vim
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } " filetree in vim

" always load
Plug 'majutsushi/tagbar' " generate a sidebar with ctags
Plug 'jdonaldson/vaxe' " vim support for haxe projects
Plug 'tpope/vim-surround' " Quickly surround text
Plug 'tpope/vim-repeat' " add more support for command repeat
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
"Plug 'bling/vim-bufferline' " list buffers in statusbar
Plug 'Valloric/YouCompleteMe' " autocompletion. Conf needed

" some ..line generators
"Plug 'edkolev/promptline.vim' " a airline prompt generator for shell
"Plug 'edkolev/tmuxline.vim' " an airline tmux statusbar generator

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

"───────── vim-multiple-cursor ─────────
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-l>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ─────────────── Ctrl-P ───────────────
let g:ctrlp_root_markers = ['project.xml', 'project.lime', '.project']
let g:ctrlp_by_filename = 1
let g:ctrlp_reuse_window = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <leader>p :CtrlPBufTag<CR>
noremap <leader>P :CtrlPBufTagAll<CR>
noremap <c-b> :CtrlPBuffer<CR>
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
" ───────────── Easymotion ──────────────
" easymotion is generally <leader><leader> motion
" but in some cases map single leader to most used functions
" resoning is that EM takes up such a huge amount of binds I wanted it to have
" its own 'space' so that single leader leaves room for other stuff

"let g:EasyMotion_do_mapping = 0 " Disable default mappings
" define my own prefix (default <leader><leader>
"map , <Plug>(easymotion-prefix)

let g:EasyMotion_smartcase = 1

" map two letter motion to s
nmap <leader>s <Plug>(easymotion-s2)

" use easymotion searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" line movement
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

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

" set common register in vim+x
set clipboard=unnamed,unnamedplus

nmap ]y <plug>EasyClipSwapPasteForward
nmap [y <plug>EasyClipSwapPasteBackwards
let g:EasyClipShareYanks = 1
" ─────────────── Gruvbox ────────────────
" Set theme
"colorscheme railscasts
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark " Setting dark mode

" ──────────────── Vaxe ─────────────────
let g:vaxe_cache_server = 1
let g:vaxe_prefer_lime = 1
let g:vaxe_lime_target = 'html5 -debug'
let g:vaxe_cache_server_autostart = 1
let g:vaxe_completion_prevent_bufwrite_events = 1
let g:vaxe_completion_disable_optimizations = 0
"autocmd BufNewFile,BufRead /project/* vaxe#ProjectLime("/project/project.lime")
map <leader>vi :call vaxe#ImportClass()<CR>
" ─────────────── Tagbar ────────────────
nmap <leader>t :TagbarToggle<CR>

" ────── Reload vim conf on save ───────
" source conf on save
"augroup reload_vimrc " {
    "autocmd!
    "autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }

" ───────────── Bufferline ──────────────
"let g:bufferline_active_buffer_left = ''
"let g:bufferline_active_buffer_right = ''
"let g:bufferline_modified = '+'
"let g:airline#extensions#bufferline#overwrite_variables=0
"let g:bufferline_active_highlight = 'StatusLine'
"let g:bufferline_show_bufnr = 0
"let g:bufferline_echo = 0
"autocmd VimEnter *
  "\ let &statusline='%{bufferline#refresh_status()}'
    "\ .bufferline#get_status_string()

" ───────────── NERDTree ───────────────
"map <leader>n :NERDTreeToggle<CR>

"" show hidden files in nerdtree
"let NERDTreeShowHidden=1
"let NERDTreeShowBookmarks=1
"let NERDTreeQuitOnOpen=1
"" close vim if nerdtree is only window remaining
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" ───────────── Keybinds ──────────────
" change mapleader
"let mapleader = ","

" quickly quit a buffer.
"nnoremap <c-q> :bd<CR>

" press enter to exit search highlight
"nnoremap <CR> :nohlsearch<CR><CR>

" access x clipboard with leader+p/y
"nnoremap <leader>y "+y
"nnoremap <leader>yy "+yy
"vnoremap <leader>y "+y
"vnoremap <leader>yy "+yy
"vnoremap <leader>p "+p
"nnoremap <leader>p "+p
"nnoremap <leader>P "+p
" Move across wrapped lines like regular lines
