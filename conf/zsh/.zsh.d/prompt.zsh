# > ┳━┓┳━┓┏━┓┏┏┓┳━┓┏┓┓
# > ┃━┛┃┳┛┃ ┃┃┃┃┃━┛ ┃
# > ┇  ┇┗┛┛━┛┛ ┇┇   ┇

# RPROMPT="%(?.[%j].%F{red}[%?]%f [%j]%f"

# https://dougblack.io/words/zsh-vi-mode.html
# https://github.com/sindresorhus/pure/wiki
autoload -U promptinit && promptinit
prompt pure

VIM_PROMPT="❯"
PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

prompt_pure_update_vim_prompt() {
    zle || {
        print "error: pure_update_vim_prompt must be called when zle is active"
        return 1
    }
    VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select { 
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

## OLD {{{1
# enable colors before setting prompt variable
# autoload -U colors && colors
# # Define mode prompts. Both turn red on non-zero exit code
# #PROMPT_SYMBOL_VIINS="%(?.%F{white}.%F{red})%f%F{magenta}%f "
# #PROMPT_SYMBOL_VICMD="%(?.%F{white}.%F{red})%f%F{magenta}%f "

# PROMPT_SYMBOL_VIINS="%F{magenta}❯%f%(?.%F{brightwhite}.%F{red})❯%f "
# PROMPT_SYMBOL_VICMD="%F{magenta}❮%f%(?.%F{brightwhite}.%F{red})❯%f "

# PROMPT=$PROMPT_SYMBOL_VIINS

# function zle-line-init () {
#   # Make sure the terminal is in application mode, when zle is
#   # active. Only then are the values from $terminfo valid.
#   if (( ${+terminfo[smkx]} )); then
#     printf '%s' "${terminfo[smkx]}"
#   fi
#   prompt_mode
# }
# function zle-line-finish () {
#   # Make sure the terminal is in application mode, when zle is
#   # active. Only then are the values from $terminfo valid.
#   if (( ${+terminfo[rmkx]} )); then
#     printf '%s' "${terminfo[rmkx]}"
#   fi

#   # return to block on command
#   #if [ -z ${TMUX+x} ]; then
#      #print -n -- "\E[2 q"
#   #else
#      #print -n -- "\EPtmux;\E\E[2 q\E\\"
#   #fi

# }
# function zle-keymap-select () {
#   prompt_mode
# }

# # change cursor and or prompt based on prompt mode.
# # big thanks to: http://blog.yjl.im/2014/12/passing-escape-codes-for-changing-font.html
# function prompt_mode() {
#   # change prompt in VTE compatible terminals
#   case $KEYMAP in
#     vicmd)

#       # change to block cursor
#       #if [ -z ${TMUX+x} ]; then
#         #print -n -- "\E[2 q"
#       #else
#         #print -n -- "\EPtmux;\E\E[2 q\E\\"
#       #fi
#       PROMPT=$PROMPT_SYMBOL_VICMD
#       ;;
  #     viins|main)

    #       # change to line cursor
    #       #if [ -z ${TMUX+x} ]; then
    #         #print -n -- "\E[6 q"
    #       #else
    #         #print -n -- "\EPtmux;\E\E[6 q\E\\"
    #       #fi
    #       PROMPT=$PROMPT_SYMBOL_VIINS
    #       ;;
    #   esac
    #   zle reset-prompt
    #   zle -R
    # }

    # # zle -N zle-line-init
    # # zle -N zle-line-finish
    # # zle -N zle-keymap-select
    #}}}
