if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " au! commands to set the filetype go here
  "au! BufNewFile,BufRead *.conf setf cfg 
  au! BufNewFile,BufRead .Xresources,*.Xresources,*.xresources,.rofirc setf xdefaults 
  au! BufNewFile,BufRead infinality.conf setf xml 

augroup END

