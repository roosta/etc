# use pure prompt
#fpath=($HOME/.zsh/functions $fpath)
#autoload -U promptinit && promptinit
#prompt pure

PURE_PROMPT_SYMBOL=""

#PROMPT='%(?.%F{magenta}.%F{red})${${KEYMAP/vicmd/❮%f}/(main|viins)/❯%f} '
#function zle-line-init zle-keymap-select {
    #zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

#function zle-keymap-select {
  #vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  #__promptline
  #zle reset-prompt
#}
#zle -N zle-keymap-select

#function zle-line-finish {
  #vim_mode=$vim_ins_mode
#}
#zle -N zle-line-finish

#function TRAPINT() {
  #vim_mode=$vim_ins_mode
  #return $(( 128 + $1 ))
#}
# attempt at changing cursor shape in vim/cmd mode
#zle-keymap-select () {
  #case $KEYMAP in
    #vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    #viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  #esac
#}

