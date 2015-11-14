# ┳━┓┳━┓┏━┓┏┏┓┳━┓┏┓┓
# ┃━┛┃┳┛┃ ┃┃┃┃┃━┛ ┃
# ┇  ┇┗┛┛━┛┛ ┇┇   ┇

PROMPT_SYMBOL_VIINS=""
PROMPT_SYMBOL_VICMD=""

function zle-line-init zle-keymap-select {
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# attempt at changing cursor shape in vim/cmd mode
#zle-keymap-select () {
  #case $KEYMAP in
    #vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    #viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  #esac
#}

