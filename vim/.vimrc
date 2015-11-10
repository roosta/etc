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
" │ https://github.com/xero/dotfiles/tree/master/vim
" │ https://github.com/trapd00r/configs/tree/master/vim
" ┆

" must be first, because it changes other options as a side effect
if &compatible
  set nocompatible
endif

" ┌─┐┬─┐┌┐┐o┌─┐┌┐┐┐─┐
" │ ││─┘ │ ││ ││││└─┐
" ┘─┘┆   ┆ ┆┘─┘┆└┘──┘

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
"set noswapfile

"set shell=zsh\ -i

" wild*
set wildmenu " command line completion
set wildmode=longest,list,full
set wildignorecase
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
set scrolloff=7
set t_Co=256 " force 256colors
set lazyredraw " stop unnecessary rendering

" Highlights
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

" SEARCHING
set incsearch
set ignorecase
set smartcase
set magic
set gdefault " the /g flag on :s substitutions by default

set mouse=a
set fo-=o
set relativenumber

set tags+=./.tags

" INACTIVE
" --------
"set clipboard=unnamed " set same clipboard for vim and X: using EasyClip. See Plugins
"set paste
"set hlsearch " using easymotion for hl
"set autowrite

" ┌─┐┬ ┐┬─┐┐─┐┌─┐┬─┐
" │  │ ││┬┘└─┐│ ││┬┘
" └─┘┆─┘┆└┘──┘┘─┘┆└┘

" change cursor depending on mode (VTE compatible terminals)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

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

" Move across wrapped lines like regular lines
"noremap 0 ^ " Go to the first non-blank character of a line
"noremap ^ 0 " Just in case you need to go to the very beginning of a line

" remove all trailing whitespace
noremap <leader>cw :StripWhitespace<CR>

" source config on demand
" Note that this cause some plugin conf not to load properly if it has init logic
noremap <c-w>r :source $MYVIMRC<CR>

" Close all the buffers
"map <leader>ba :%bdelete<CR>
map <leader>bn :bnext<CR>
map <leader>bp :bprevious<CR>
map <leader>bd :bdelete<CR>

" Tab management
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
" map <leader>tm :tabmove

" Switch between Vim window splits
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" resize splits
"nnoremap <C-w>Up    :exe "resize " .          (winheight(0) * 3/2)<CR>
"nnoremap <C-w>Down  :exe "resize " .          (winheight(0) * 2/3)<CR>
"nnoremap <C-w>Left  :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
"nnoremap <C-w>Right :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"nnoremap <A-Up>    :normal <c-r>=SwitchWindow('+')<CR><CR>
"nnoremap <A-Down>  :normal <c-r>=SwitchWindow('-')<CR><CR>
"nnoremap <A-Left>  :normal <c-r>=SwitchWindow('<')<CR><CR>
"nnoremap <A-Right> :normal <c-r>=SwitchWindow('>')<CR><CR>

" ┬─┐┬  ┬ ┐┌─┐o┌┐┐┐─┐
" │─┘│  │ ││ ┬││││└─┐
" ┆  ┆─┘┆─┘┆─┘┆┆└┘──┘

" Setup plugin manager vim-plug: https://github.com/junegunn/vim-plug
" download vim-plug if not present in 'autoload'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" clojure/script
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kovisoft/paredit'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
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
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" colorscheme
Plug 'morhetz/gruvbox'

" syntax:
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'

" inactive
"Plug 'tpope/vim-commentary'
"Plug 'vim-scripts/YankRing.vim'
"Plug 'tpope/vim-classpath'
"Plug 'venantius/vim-eastwood'
"Plug 'jgdavey/tslime.vim'
"Plug 'majutsushi/tagbar'
"Plug 'edkolev/promptline.vim'
"Plug 'edkolev/tmuxline.vim'
call plug#end()

syntax on
filetype plugin indent on

" SYNTASTIC
" ---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1

" VIM-MULTIPLE-CURSOR
" -------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-l>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" CTRL-P
" -------
let g:ctrlp_use_caching = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_show_hidden = 1
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_reuse_window = 1

" Find in your current directory
nmap <leader>p :CtrlP<cr>

" Find within all your open buffers.
nmap <leader>bb :CtrlPBuffer<cr>
nmap <c-b> :CtrlPBuffer<cr>

" Find within all your open buffers sorted by Most Recently Used (MRU).
nmap <leader>bm :CtrlPMixed<cr>

" Find with a mix of all the above.
nmap <leader>bs :CtrlPMRU<cr>

let g:ctrlp_root_markers = ['project.xml', 'project.lime', '.project', '.proj', '.git', 'project.clj']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|cljs_rhino_repl|repl|)|\_site|\build|\node_modules|dist|undo|out)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|tags)$',
\}

" thank you: https://github.com/sykora/etc/blob/master/vim/vimrc
let g:ctrlp_prompt_mappings = {
\   'PrtClearCache()': ['<F5>'],
\}

" EASYMOTION
" ----------
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

" QUICKSCOPE
" ----------
let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
let g:qs_first_occurrence_highlight_color = 155       " terminal vim

let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
let g:qs_second_occurrence_highlight_color = 81         " terminal vim

" Trigger a highlight in the appropriate direction when pressing these keys:
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" AIRLINE
" -------
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1

" BUFFERLINE
" ----------
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 0
let g:bufferline_solo_highlight = 1
let g:bufferline_echo = 0

" EASYCLIP
" --------
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

" GRUVBOX
" -------
" Set theme
"let g:gruvbox_italicize_comments = 0
let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
set background=dark

" RAINBOW PARENTHESIS
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

" auto enable Rainbow for all closures
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NERDTREE
" --------
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1

" close vim if nerdtree is only window remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDCOMMENT
" -----------
" mirrow tpope commentary keys.
"
nmap gcc <plug>NERDCommenterToggle
vmap gc <plug>NERDCommenterToggle

" PAREDIT
" -------
let g:paredit_electric_return = 0
let g:paredit_leader = '\'
"let g:paredit_disable_clojure = 0

"  EASY-ALIGN
" ------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" INDENT GUIDES
" -------------
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" ACK.VIM
" -----------
let g:ackprg = 'ag --vimgrep'


" ┌─┐┌─┐┌┌┐┌┌┐┬─┐┌┐┐┬─┐┐─┐
" │  │ ││││││││─┤││││ │└─┐
" └─┘┘─┘┘ ┆┘ ┆┘ ┆┆└┘┆─┘──┘

" https://github.com/tpope/vim-fireplace/pull/222
command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

" ┬─┐┬ ┐┌┐┐┌─┐┌┐┐o┌─┐┌┐┐┐─┐
" ├─ │ │││││   │ ││ ││││└─┐
" ┆  ┆─┘┆└┘└─┘ ┆ ┆┘─┘┆└┘──┘

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

" window switch function. Binds are added at keybinds sections
function! SwitchWindow(dir)
  let this = winnr()
  if '+' == a:dir
    execute "normal \<c-w>k"
    elseif '-' == a:dir
    execute "normal \<c-w>j"
    elseif '>' == a:dir
    execute "normal \<c-w>l"
    elseif '<' == a:dir
    execute "normal \<c-w>h"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction








" holding on to these just in case I'll need them again
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


