# > ┳┏ ┳━┓┓ ┳┳━┓o┏┓┓┳━┓┓━┓
# > ┣┻┓┣━ ┗┏┛┃━┃┃┃┃┃┃ ┃┗━┓
# > ┇ ┛┻━┛ ┇ ┇━┛┇┇┗┛┇━┛━━┛
# > ----------------------
# sources:
# https://github.com/xero/dotfiles/blob/master/zsh/.zsh/keybindings.zsh

# set key bindings (e = emacs, v = vi)
bindkey -v
#zmodload zsh/terminfo

# 10ms for key sequences
# make keymode indication more responsive
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

# Bind up arrow, down arrow to zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# bind k and j for VI mode hist substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# [Space] - do history expansion
bindkey ' ' magic-space

bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word
bindkey -M vicmd '^[[1;5C' forward-word # same for vi mode
bindkey -M vicmd '^[[1;5D' backward-word # same for vi mode

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

