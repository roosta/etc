setlocal makeprg=make\ bin/%<.o

" https://jbernard.io/2011/09/30/vim-makeprg.html
" if !filereadable(expand("%:p:h")."/Makefile")
"     setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
" endif
