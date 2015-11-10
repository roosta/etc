
# use pure prompt
fpath=($HOME/.zsh/functions $fpath)
autoload -U promptinit && promptinit
PURE_PROMPT_SYMBOL=""
prompt pure

#zle-keymap-select () {
  #case $KEYMAP in
    #vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    #viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  #esac
#}

#PROMPT=$HOME/.zsh/prompts/bullet_train.zsh
#PROMPT=$HOME/.zsh/prompts/promptline.zsh
#PROMPT=$HOME/.zsh/prompts/pure.zsh

# autoload prompt functions
#fpath=($HOME/.zsh/prompts $fpath)
#autoload -U $HOME/.zsh/prompts/functions/*(:t)

# enable auto-execution of functions
#typeset -ga preexec_functions
#typeset -ga precmd_functions
#typeset -ga chpwd_functions

# allow functions in the prompt
#setopt PROMPT_SUBST

#[ -f $PROMPT ] && source $PROMPT

