# ┳━┓┳━┓┏━┓┏┏┓┳━┓┏┓┓
# ┃━┛┃┳┛┃ ┃┃┃┃┃━┛ ┃
# ┇  ┇┗┛┛━┛┛ ┇┇   ┇

#PURE_PROMPT_SYMBOL_VIINS=""
#PURE_PROMPT_SYMBOL_VICMD=""
PURE_PROMPT_SYMBOL=""

#function zle-line-init zle-keymap-select {
  #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

#setopt prompt_subst

# attempt at changing cursor shape in vim/cmd mode
#zle-keymap-select () {
  #case $KEYMAP in
    #vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    #viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  #esac
#}

