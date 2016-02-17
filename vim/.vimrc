"┌──────────────────────────────────────┐
"│█▀▀▀▀▀▀▀▀█░░░░█░█░▀█▀░█▄█░░░█▀▀▀▀▀▀▀▀█│
"│█▀▀▀▀▀▀▀▀█░░░░▀▄▀░░█░░█░█░░░█▀▀▀▀▀▀▀▀█│
"│█▀▀▀▀▀▀▀▀▀░░░░░▀░░▀▀▀░▀░▀░░░▀▀▀▀▀▀▀▀▀█│
"│█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█│
"│█ author : roosta <mail@roosta.sh>   █│
"│█ site   : http://dotfiles.roosta.sh █│
"│█ github : https://github.com/roosta █│
"└──────────────────────────────────────┘
" OPTIONS {{{1
" -------------------
" ┌─┐┬─┐┌┐┐o┌─┐┌┐┐┐─┐
" │ ││─┘ │ ││ ││││└─┐
" ┘─┘┆   ┆ ┆┘─┘┆└┘──┘
" -------------------
" must be first, because it changes other options as a side effect
if &compatible
  set nocompatible
endif

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo

" disable swapfile
"set noswapfile

" set shell, grants alias usage among other things.
"set shell=zsh\ -i

set t_Co=256

" wild*
set wildmenu " give menu on completion
set wildmode=longest,list,full " define wildmode appearance
set wildignorecase " ignore case on completion

" define various ignored folders when using fzf/ctrlp/whatever else uses
" wildmode
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*,
               \*/dist/*,*/undo/*,*/out/*,*/.repl*,*/.cljs_rhino_repl/*,
               \*/_site/*

" fix backspace behaviour
set backspace=indent,eol,start

" interface
set timeoutlen=1000 ttimeoutlen=0 " adjust timeouts for escaping normal mode.
set laststatus=2 " Always display the statusline in all windows
set showtabline=1 " Always display the tabline, even if there is only one tab
set showcmd " show partial command in last line of screen
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set shortmess+=I " dont display startup message
set scrolloff=7 "	Minimal number of screen lines to keep above and below the cursor.
set t_Co=256 " force 256colors
set lazyredraw " stop unnecessary rendering
set ttyfast " improve drawing in tmux

" Highlights
set cursorline " highlight current line
set number " show line numbers
set matchtime=2 " time to display matching brackets
set showmatch " show matching brackets/parenthesis
set relativenumber " use relative line numbers. See functions for quick switch back to normal

" linewrap
set wrap " wrap long lines.
set linebreak " break on chars defined in "breakat"
set breakindent "match indent on break
set breakat=" ^I!@*-+;:,./?"
set showbreak=↳\
set cpoptions+=n " dont show linenumbers on wrap

" Indentation
set expandtab " tabs are spaces
set shiftwidth=2 " use indents of 2 spaces
set tabstop=2 " use indents of 2 spaces
set softtabstop=2 " let backspace delete indent

" SEARCHING
set incsearch " match while typing
set ignorecase
set magic " :help magic
set gdefault " the /g flag on :s substitutions by default

set mouse=a " enable mouse
set fo-=o " disable 'new comment line' by removing the format option. Still happens so suspect one of my plugins...
set tags+=./.tags " used with ctags. Defines tag files.
"}}}
" CURSOR {{{1
" ------------------
" ┌─┐┬ ┐┬─┐┐─┐┌─┐┬─┐
" │  │ ││┬┘└─┐│ ││┬┘
" └─┘┆─┘┆└┘──┘┘─┘┆└┘
" ------------------
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" change cursor depending on mode (VTE compatible terminals running tmux)
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"

" change cursor depending on mode (VTE compatible terminals)
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"

" Always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside
" an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
"}}}
" GVIM {{{1
" ----------
" ┌─┐┐ ┬o┌┌┐
" │ ┬│┌┘││││
" ┆─┘└┘ ┆┘ ┆
" ----------
if has('gui_running')
  "set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set lines=60 columns=108 linespace=0
  set guifont=Essential\ PragmataPro\ 14px
  set guiheadroom=0
endif
"}}}
" KEYBINDS {{{1
" ----------------------
" ┬┌ ┬─┐┐ ┬┬─┐o┌┐┐┬─┐┐─┐
" ├┴┐├─ └┌┘│─││││││ │└─┐
" ┆ ┘┴─┘ ┆ ┆─┘┆┆└┘┆─┘──┘
" ----------------------
" Move across wrapped lines like regular lines
noremap 0 ^ " Go to the first non-blank character of a line
noremap ^ 0 " Just in case you need to go to the very beginning of a line

" remove all trailing whitespace
noremap <leader>cw :StripWhitespace<CR>

" source config on demand
" Note that this may cause some plugins not to load properly if it has init logic
noremap <c-w>r :source $MYVIMRC<CR>

" Close all the buffers
"map <leader>ba :%bdelete<CR>
map <leader>bn :bnext<CR>
map <leader>bp :bprevious<CR>
map <leader>bd :bdelete<CR>

" Tab management
"map <leader>tn :tabnew<CR>
"map <leader>to :tabonly<CR>
"map <leader>tc :tabclose<CR>
" map <leader>tm :tabmove

" Switch between Vim window splits
noremap <silent> <A-Up>    :wincmd k<CR>
noremap <silent> <A-Down>  :wincmd j<CR>
noremap <silent> <A-Left>  :wincmd h<CR>
noremap <silent> <A-Right> :wincmd l<CR>

noremap <silent> <A-k> :wincmd k<CR>
noremap <silent> <A-j> :wincmd j<CR>
noremap <silent> <A-h> :wincmd h<CR>
noremap <silent> <A-l> :wincmd l<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
nnoremap <silent> <A-S-Left>  5<C-w><
nnoremap <silent> <A-S-Down>  5<C-W>-
nnoremap <silent> <A-S-Up>    5<C-W>+
nnoremap <silent> <A-S-Right> 5<C-w>>

nnoremap <silent> <A-S-h> 5<C-w><
nnoremap <silent> <A-S-j> 5<C-W>-
nnoremap <silent> <A-S-k> 5<C-W>+
nnoremap <silent> <A-S-l> 5<C-w>>

" jump paragraphs with ctrl-{movement}
noremap <C-Up> {
noremap <C-Down> }
noremap <C-k> {
noremap <C-j> }

noremap <leader>ccl :cclose<CR>
noremap <leader>lcl :lclose<CR>
" }}}
" FUNCTIONS {{{
" -------------------------
" ┬─┐┬ ┐┌┐┐┌─┐┌┐┐o┌─┐┌┐┐┐─┐
" ├─ │ │││││   │ ││ ││││└─┐
" ┆  ┆─┘┆└┘└─┘ ┆ ┆┘─┘┆└┘──┘
" -------------------------
" https://github.com/tpope/vim-fireplace/pull/222
"command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

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

" }}}
" PLUGIN MANAGER {{{1
" -------------------
" Setup plugin manager vim-plug: https://github.com/junegunn/vim-plug
" download vim-plug if not present in 'autoload'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'svermeulen/vim-easyclip'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" compl/lint
Plug 'scrooloose/syntastic' ", { 'on': 'SyntasticCheck' }

" Using AUR to simplify build process on Arch
"Plug 'Valloric/YouCompleteMe' , { 'do': './install.py' }

" navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'    }
Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle'      }

" GUI
Plug 'morhetz/gruvbox'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'

" syntax:
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'junegunn/rainbow_parentheses.vim'

" cloujure
"Plug 'kovisoft/paredit',    { 'for': 'clojure' }
Plug 'bhurlow/vim-parinfer', { 'for': ['clojure', 'scheme'], 'dir': '~/.vim/plugged/vim-parinfer', 'do': 'npm install' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
"Plug 'venantius/vim-eastwood'
Plug 'tpope/vim-salve', { 'for': 'clojure' }
"Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'guns/vim-sexp'

" inactive
"Plug 'terryma/vim-expand-region'
"Plug 'gorodinskiy/vim-coloresque'
"Plug 'guns/vim-clojure-static'
"Plug 'kien/ctrlp.vim'
"Plug 'tpope/vim-commentary'
"Plug 'vim-scripts/YankRing.vim'
"Plug 'tpope/vim-classpath'
"Plug 'jgdavey/tslime.vim'
"Plug 'edkolev/promptline.vim'
"Plug 'edkolev/tmuxline.vim'
call plug#end()

syntax on
filetype plugin indent on
"}}}
" SYNTASTIC {{{1
" --------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
"}}}
" VIM-MULTIPLE-CURSOR {{{1
" -------------------
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-l>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}
" FZF.VIM {{{1
" -------
" https://github.com/junegunn/fzf.vim

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader>f  :Files<CR>
nmap <leader>bb :Buffers<cr>
nmap <leader>t :Tags<cr>
nmap <leader>y  :BTags<cr>
nmap <leader>c :Commits<cr>
nmap <leader>v :BCommits<cr>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" }}}
" EASYMOTION {{{1
" ---------------
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
"EMCommandLineNoreMap <c-v> <plug>EasyClipCommandModePaste
" }}}
" QUICKSCOPE {{{1
" ---------------
let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
let g:qs_first_occurrence_highlight_color = 155       " terminal vim

let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
let g:qs_second_occurrence_highlight_color = 81         " terminal vim

" Trigger a highlight in the appropriate direction when pressing these keys:
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}
" AIRLINE {{{1
" ------------
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1

"}}}
" BUFFERLINE {{{1
" ---------------
"
"let g:bufferline_active_buffer_left = ''
"let g:bufferline_active_buffer_right = ''
"let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 0
let g:bufferline_solo_highlight = 1
let g:bufferline_echo = 0
"let g:bufferline_inactive_highlight = 'StatusLine'
"let g:bufferline_active_highlight = 'StatusLineNC'

"}}}
" EASYCLIP {{{1
" -------------

" remap mark to gm since EasyClip cut shadows m key
nnoremap gm m
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste

" set common register in vim+x
set clipboard=unnamed,unnamedplus

"let g:EasyClipUsePasteToggleDefaults = 0
"nmap <c-.> <plug>EasyClipSwapPasteForward
"nmap <c-,> <plug>EasyClipSwapPasteBackwards
"nmap ]y <plug>EasyClipSwapPasteForward
"nmap [y <plug>EasyClipSwapPasteBackwards
let g:EasyClipShareYanks = 1

" }}}
" GRUVBOX {{{1
" ------------

" Set theme
"let g:gruvbox_italicize_comments = 0
let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
set background=dark

" }}}
" RAINBOW PARENTHESIS {{{1
" ------------------------

au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
"let g:rbpt_loadcmd_toggle = 0

" }}}
" NERDTREE {{{1
" -------------
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1

" close vim if nerdtree is only window remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"}}}}
" NERDCOMMENT {{{1
" ----------------
" mirror tpope commentary keys.
nmap gcc <plug>NERDCommenterToggle
vmap gc <plug>NERDCommenterToggle

"}}}
" PAREDIT {{{1
" -----------

let g:paredit_electric_return = 0
let g:paredit_leader = '\'
"let g:paredit_disable_clojure = 0

" }}}
" EASY-ALIGN {{{1
" ---------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" INDENT GUIDES {{{1
" ------------------
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" }}}
" ACK.VIM {{{1
" ------------
let g:ackprg = 'ag --vimgrep'
"}}}
" UNDOTREE {{{1
nnoremap <leader>ut :UndotreeToggle<cr>
"}}}
" BETTER-WHITESPACE {{{1
" strip whitespace on save
autocmd BufWritePre * StripWhitespace
"}}}
" INACTIVE {{{
" --------------------
" o┌┐┐┬─┐┌─┐┌┐┐o┐ ┬┬─┐
" │││││─┤│   │ ││┌┘├─
" ┆┆└┘┘ ┆└─┘ ┆ ┆└┘ ┴─┘
" --------------------
" Old configuration that I keep here for posterity
" ------------------------------------------------

" OPTIONS
" -------
"set clipboard=unnamed " set same clipboard for vim and X: using EasyClip. See Plugins
"set paste
"set hlsearch " using easymotion for hl
"set autowrite


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

" CTRL-P
" -------
"let g:ctrlp_use_caching = 1
"let g:ctrlp_follow_symlinks = 1
"let g:ctrlp_show_hidden = 1
"let g:ctrlp_working_path_mode = '0' " use the current folder, not repo root

""let g:ctrlp_working_path_mode = 'r'
""let g:ctrlp_map = '<c-p>'
""let g:ctrlp_cmd = 'CtrlP'
""let g:ctrlp_reuse_window = 1

"" Find in your current directory
"nmap <leader>p :CtrlP<cr>

"" Find within all your open buffers.
"nmap <leader>bb :CtrlPBuffer<cr>
"nmap <c-b> :CtrlPBuffer<cr>

"" Find within all your open buffers sorted by Most Recently Used (MRU).
"nmap <leader>bm :CtrlPMixed<cr>

"" Find with a mix of all the above.
"nmap <leader>bs :CtrlPMRU<cr>

"let g:ctrlp_root_markers = ['project.xml', 'project.lime', '.project', '.proj', '.git', 'project.clj']

"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/](\.(git|hg|svn|cljs_rhino_repl|repl|)|\_site|\build|\node_modules|dist|undo|out)$',
  "\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|tags)$',
"\}

"" thank you: https://github.com/sykora/etc/blob/master/vim/vimrc
"let g:ctrlp_prompt_mappings = {
"\   'PrtClearCache()': ['<F5>'],
"\}


"}}}
" vim: fdm=marker:sw=2
