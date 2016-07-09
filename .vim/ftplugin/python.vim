setlocal tabstop=8
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal autoindent
setlocal makeprg=flake8\ %
nmap <buffer> <F5> :!python %<CR>
