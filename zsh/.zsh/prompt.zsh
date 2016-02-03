# > ┳━┓┳━┓┏━┓┏┏┓┳━┓┏┓┓
# > ┃━┛┃┳┛┃ ┃┃┃┃┃━┛ ┃
# > ┇  ┇┗┛┛━┛┛ ┇┇   ┇

# define prompt symbol values.
# Note this only works with my pure-prompt fork (github.com/roosta/pure/tree/vimode)
#PURE_PROMPT_SYMBOL_VIINS="%F{blue}%f%F{magenta%f"
#PURE_PROMPT_SYMBOL_VICMD="%F{blue}%f%F{magenta}%f"

# Define mode prompts. Both turn red on non-zero exit code
PROMPT_SYMBOL_VIINS="%(?.%F{white}.%F{red})%f%F{magenta}%f "
PROMPT_SYMBOL_VICMD="%(?.%F{white}.%F{red})%f%F{magenta}%f "

#PROMPT_SYMBOL_VIINS="%K{magenta}%{$fg[white]%}%{$reset_color%}%{$fg[magenta]%}%k%{$reset_color%} "
#PROMPT_SYMBOL_VICMD="%F{white}%f%F{magenta}%f "

# enable colors before setting prompt variable
autoload -U colors && colors
PROMPT=$PROMPT_SYMBOL_VIINS
RPROMPT="%(?.[%j].%F{red}[%?]%f [%j]%f"

function zle-line-init () {
  # Make sure the terminal is in application mode, when zle is
  # active. Only then are the values from $terminfo valid.
  if (( ${+terminfo[smkx]} )); then
    printf '%s' "${terminfo[smkx]}"
  fi
  prompt_mode
}
function zle-line-finish () {
  # Make sure the terminal is in application mode, when zle is
  # active. Only then are the values from $terminfo valid.
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' "${terminfo[rmkx]}"
  fi
  print -n -- "\ePtmux;\e\e[2 q\e\\" # return to block on command
}
function zle-keymap-select () {
  prompt_mode
}

function prompt_mode() {
  # change prompt in VTE compatible terminals
  case $KEYMAP in
    vicmd)
      print -n -- "\ePtmux;\e\e[2 q\e\\" # block cursor
      PROMPT=$PROMPT_SYMBOL_VICMD
      ;;
    viins|main)
      print -n -- "\ePtmux;\e\e[6 q\e\\" # line cursor
      PROMPT=$PROMPT_SYMBOL_VIINS
      ;;
  esac

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

autoload -U promptinit && promptinit
prompt pure

