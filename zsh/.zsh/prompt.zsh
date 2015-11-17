# > ┳━┓┳━┓┏━┓┏┏┓┳━┓┏┓┓
# > ┃━┛┃┳┛┃ ┃┃┃┃┃━┛ ┃
# > ┇  ┇┗┛┛━┛┛ ┇┇   ┇

# define prompt symbol values.
# Note this only works with my pure-prompt fork (github.com/roosta/pure/tree/vimode)
PURE_PROMPT_SYMBOL_VIINS="%F{blue}%f%F{magenta%f"
PURE_PROMPT_SYMBOL_VICMD="%F{blue}%f%F{magenta}%f"

# Make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
# ^^ this ties into keybinds.zsh and had to merge those conditions with
# ^^ prompt stuff since I couldn't figure out how to extend a defined zle function
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
    printf '%s' "${terminfo[smkx]}"
    cursor_shape
  }
  function zle-line-finish () {
    printf '%s' "${terminfo[rmkx]}"
    print -n -- "\E[2 q" # return to block on command
  }
  function zle-keymap-select () {
    cursor_shape
  }
  zle -N zle-line-init
  zle -N zle-line-finish
  zle -N zle-keymap-select
fi

function cursor_shape() {
  # change cursor shape in VTE compatible terminals
  case $KEYMAP in
    vicmd)      print -n -- "\E[2 q";;  # block cursor
    viins|main) print -n -- "\E[6 q";;  # line cursor
  esac

  zle reset-prompt
  zle -R
}
