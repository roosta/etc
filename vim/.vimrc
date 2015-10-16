" ┌──────────────────────────────────────┐
" │▀▀▀░░░░░░░░░░█░█░▀█▀░█▄█░░░░░░░░░░░▀▀▀│
" │▀▀▀▀▀▀░░░░░░░▀▄▀░░█░░█░█░░░░░░░▀▀▀▀▀▀▀│
" │▀▀▀▀▀▀▀▀▀▀░░░░▀░░▀▀▀░▀░▀░░░▀▀▀▀▀▀▀▀▀▀▀│
" │█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█│
" │█ author : roosta <mail@roosta.sh>   █│
" │█ site   : http://dotfiles.roosta.sh █│
" │█ github : https://github.com/roosta █│
" └──────────┬───────────────────────────┘
"  sources:  │
" ┌──────────┘
" │https://github.com/xero/dotfiles/tree/master/vim
" │https://github.com/trapd00r/configs/tree/master/vim
" ┆

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
if &compatible
  set nocompatible
endif

" ┌─┐┬─┐┌┐┐o┌─┐┌┐┐┐─┐
" │ ││─┘ │ ││ ││││└─┐
" ┘─┘┆   ┆ ┆┘─┘┆└┘──┘
" └─────────────── ─ ─

" using EasyClip. See Plugins
"set clipboard=unnamed " set same clipboard for vim and X
"set paste

" set autowrite

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

"set shell=zsh\ -i

" wild*
set wildmenu " command line completion
set wildmode=longest,list,full
"set wildmode=longest:full,full
set wildignorecase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*,*/dist/*,*/undo/*,
      \*/out/*,*/.repl*,*/.cljs_rhino_repl/*,*/_site/*

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
"set hlsearch " using easymotion for hl
set incsearch
set ignorecase
set smartcase
set magic
set gdefault " the /g flag on :s substitutions by default

set mouse=a
set fo-=o
set relativenumber

" Tags
"set tags+=tags " look for tag file at ./[here]

" change cursor depending on mode (VTE compatible terminals)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside
" an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" ┌─┐┬ ┐o
" │ ┬│ ││
" ┆─┘┆─┘┆
" └─────────────── ─ ─

if has('gui_running')
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  set guifont=Essential\ PragmataPro\ 14px
  set guiheadroom=0
endif

" ┬┌ ┬─┐┐ ┬┬─┐o┌┐┐┬─┐
" ├┴┐├─ └┌┘│─││││││ │
" ┆ ┘┴─┘ ┆ ┆─┘┆┆└┘┆─┘
" └─────────────── ─ ─

" Move across wrapped lines like regular lines
noremap 0 ^ " Go to the first non-blank character of a line
noremap ^ 0 " Just in case you need to go to the very beginning of a line

noremap <leader>ws :StripWhitespace<CR>

" source config on deman
noremap <c-w>r :source $MYVIMRC<CR>

" Close all the buffers
map <leader>ba :%bdelete<CR>

" Tab management
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
" map <leader>tm :tabmove

" Switch between Vim window splits
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" resize splits
nnoremap <silent> <Leader><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Leader>-:exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" ┬─┐┬  ┬ ┐┌─┐o┌┐┐┐─┐
" │─┘│  │ ││ ┬││││└─┐
" ┆  ┆─┘┆─┘┆─┘┆┆└┘──┘
" └─────────────── ─ ─

" Setup plugin manager vim-plug: https://github.com/junegunn/vim-plug
" download vim-plug if not present in 'autoload'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'kovisoft/paredit'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'
Plug 'bling/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'svermeulen/vim-easyclip'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'

"Plug 'tpope/vim-commentary'
"Plug 'vim-scripts/YankRing.vim'
"Plug 'tpope/vim-classpath'
"Plug 'venantius/vim-eastwood'
"Plug 'jgdavey/tslime.vim'
"Plug 'bling/vim-bufferline'
"Plug 'majutsushi/tagbar'
"Plug 'edkolev/promptline.vim'
"Plug 'edkolev/tmuxline.vim'
call plug#end()

syntax on
filetype plugin indent on

" ┆Syntastic
" └── ─ ─
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1

" vim-multiple-cursor
" -------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-l>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Ctrl-P
" ---------
let g:ctrlp_root_markers = ['project.xml', 'project.lime', '.project', '.proj', '.git', 'project.clj']
" let g:ctrlp_by_filename = 1
let g:ctrlp_reuse_window = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 0
noremap <leader>p :CtrlPBufTag<CR>
noremap <leader>P :CtrlPBufTagAll<CR>
noremap <c-b> :CtrlPBuffer<CR>
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" Easymotion
" -------------------

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

" set ctrl-v to paste in easymotion command line
" EMCommandLineNoreMap <c-v> <plug>EasyClipCommandModePaste

" Quickscope
" ----------------
let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
let g:qs_first_occurrence_highlight_color = 155       " terminal vim

let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
let g:qs_second_occurrence_highlight_color = 81         " terminal vim

" Trigger a highlight in the appropriate direction when pressing these keys:
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Airline
" -------------------
let g:airline_powerline_fonts = 1

" Easyclip
" -------------------
" remap mark to gm since EasyClip cut shadows m key
let g:EasyClipUsePasteToggleDefaults = 0
nnoremap gm m

imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
let g:EasyClipShareYanks = 1

" set common register in vim+x
set clipboard=unnamed,unnamedplus

nmap ]y <plug>EasyClipSwapPasteForward
nmap [y <plug>EasyClipSwapPasteBackwards
let g:EasyClipShareYanks = 1

" Gruvbox
" -------------------
" Set theme
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark " Setting dark mode

" Rainbow Parenthesis
" -------------------
let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['yellow',       'yellow'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
  \ ]

"let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NERDTree
" --------------
map <leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1

" close vim if nerdtree is only window remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDComment
" -------------------
" mirrow tpope commentary keys.
"
nmap gcc <plug>NERDCommenterToggle
vmap gc <plug>NERDCommenterToggle

" Paredit
" -------------------
let g:paredit_electric_return = 0
let g:paredit_leader = '\'
let g:paredit_disable_clojure = 0

" easy-align
" -------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" indent guides
" -------------------
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" ┌─┐┌─┐┌┌┐┌┌┐┬─┐┌┐┐┬─┐┐─┐
" │  │ ││││││││─┤││││ │└─┐
" └─┘┘─┘┘ ┆┘ ┆┘ ┆┆└┘┆─┘──┘
" └─────────────── ─ ─

command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

" ┬─┐┬ ┐┌┐┐┌─┐┌┐┐o┌─┐┌┐┐┐─┐
" ├─ │ │││││   │ ││ ││││└─┐
" ┆  ┆─┘┆└┘└─┘ ┆ ┆┘─┘┆└┘──┘
" └─────────────── ─ ─

" if working with splits, set cursorline only on active window,
" to give an indication other than airline which split is active
augroup BgHighlight
  autocmd!
  "autocmd WinEnter * set number
  "autocmd WinLeave * set nonumber
  autocmd WinEnter * :set relativenumber
  autocmd WinLeave * :set number
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

" attempt to close quickfix when deleting buffer
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <leader><C-n> :call NumberToggle()<cr>











" o┌┐┐┬─┐┌─┐┌┐┐o┐ ┬┬─┐
" │││││─┤│   │ ││┌┘├─
" ┆┆└┘┘ ┆└─┘ ┆ ┆└┘ ┴─┘
" ------------------------
" Promptline (used to generate a prompt for terminal to match airline.
"let g:promptline_preset = {
  "\'a' : [ '$vim_mode' ],
  "\'b' : [ promptline#slices#cwd() ],
  "\'c' : [ promptline#slices#jobs() ],
  "\'warn' : [ promptline#slices#last_exit_code() ],
  "\'x' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
  "\'y' : [ promptline#slices#host() ],
  "\'z' : [ '$(date +%H:%M:%S)' ]}
": PromptlineSnapshot ~/.zsh/plugins/promptline.zsh airline_insert

"  Keybinds
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

" Vaxe
" ───────────────────
"let g:vaxe_cache_server = 1
"let g:vaxe_prefer_lime = 1
" let g:vaxe_lime_target = 'html5 -debug'
"let g:vaxe_cache_server_autostart = 1
"let g:vaxe_completion_prevent_bufwrite_events = 1
"let g:vaxe_completion_disable_optimizations = 1

"autocmd BufNewFile,BufRead /project/* vaxe#ProjectLime("/project/project.lime")
" map <leader>vi :call vaxe#ImportClass()<CR>

" Tagbar
" --------
" nmap <leader>t :TagbarToggle<CR>


