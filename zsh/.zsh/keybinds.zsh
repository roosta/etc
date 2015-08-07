# set key bindings (e = emacs, v = vi)
bindkey -v

# 10ms for key sequences
KEYTIMEOUT=1

# working delete key
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

#======= Vi mode =======
#-----------------------

## Home key variants
#bindkey '\e[1~' vi-beginning-of-line
#bindkey '\eOH' vi-beginning-of-line

## End key variants
#bindkey '\e[4~' vi-end-of-line
#bindkey '\eOF' vi-end-of-line 
