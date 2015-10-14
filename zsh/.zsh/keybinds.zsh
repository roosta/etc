# ┌──────────────────────────────────────┐
# │░░░█░█░█▀▀░█░█░█▀▄░▀█▀░█▀█░█▀▄░█▀▀░░░░│
# │░░░█▀▄░█▀▀░░█░░█▀▄░░█░░█░█░█░█░▀▀█░░░░│
# │░░░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░░░░│
# └──────────────────────────────────────┘
# source:
# https://github.com/xero/dotfiles/blob/master/zsh/.zsh/keybindings.zsh

# set key bindings (e = emacs, v = vi)
bindkey -v

#zmodload zsh/terminfo

# 10ms for key sequences
KEYTIMEOUT=1


# keybindings
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       history-substring-search-up
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     history-substring-search-down
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
    printf '%s' "${terminfo[smkx]}"
  }
  function zle-line-finish () {
    printf '%s' "${terminfo[rmkx]}"
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

#======= Vi mode =======
#-----------------------

# bind k and j for VI mode hist substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## Home key variants
#bindkey '\e[1~' vi-beginning-of-line
#bindkey '\eOH' vi-beginning-of-line

## End key variants
#bindkey '\e[4~' vi-end-of-line
#bindkey '\eOF' vi-end-of-line

## working delete key
#bindkey "^[[3~" delete-char
#bindkey "^[3;5~" delete-char
