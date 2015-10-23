if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  "au! BufNewFile,BufRead *.conf setf cfg
  au! BufNewFile,BufRead .Xresources,*.Xresources,*.xresources,.rofirc setf xdefaults
  au! BufNewFile,BufRead infinality.conf setf xml
  au! BufNewFile,BufRead *.i3 setf i3
  au! BufNewFile,BufRead *vimpagerrc setf vim
  au! BufNewFile,BufRead */irssi/config setf config
  au! BufNewFile,BufRead *.i3blocks setf config
augroup END

augroup filetypeplugin
  au! BufNewFile,BufRead *.i3 setlocal commentstring=#\ %s
augroup END

