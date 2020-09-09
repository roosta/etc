
" https://jbernard.io/2011/09/30/vim-makeprg.html
if !filereadable(expand("%:p:h")."/Makefile")
  setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<.o\ %
else
  setlocal makeprg=make\ bin/%<.o
endif

" Helper used when executing compiled c programs outputted to bin/*.o and
" outputted to new vertical buffer.
command! Exec set splitright | vnew | read ! bin/#<.o

" Helper mapping for running compiled c programs that are outputted to bin/*.o
map <F5> :! bin/%<.o<cr>

