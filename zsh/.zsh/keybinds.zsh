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
[[ -n "${key[left]}"     ]]  && bindkey  "${key[left]}"     backward-char
[[ -n "${key[right]}"    ]]  && bindkey  "${key[right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
#if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  #function zle-line-init-binds () {
    #printf '%s' "${terminfo[smkx]}"
  #}
  #function zle-line-finish-binds () {
    #printf '%s' "${terminfo[rmkx]}"
  #}
  #zle -N zle-line-init-binds
  #zle -N zle-line-finish-binds
#fi


# bind k and j for VI mode hist substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey ' ' magic-space # [Space] - do history expansion
bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

