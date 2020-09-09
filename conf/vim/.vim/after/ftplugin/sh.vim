setlocal makeprg=shellcheck\ -x\ -f\ gcc\ %

nnoremap <buffer> <F5> :!./%<cr>

" Execute content of a buffer and output result to a new split
command! Exec set splitright | vnew | set filetype=sh | read !sh #

