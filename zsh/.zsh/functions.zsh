# ┳━┓┳ ┓┏┓┓┏━┓┏┓┓o┏━┓┏┓┓┓━┓
# ┣━ ┃ ┃┃┃┃┃   ┃ ┃┃ ┃┃┃┃┗━┓
# ┇  ┇━┛┇┗┛┗━┛ ┇ ┇┛━┛┇┗┛━━┛

# enable auto-execution of functions
#typeset -ga preexec_functions
#typeset -ga precmd_functions
#typeset -ga chpwd_functions

# do a quick spellcheck in terminal
spell () {
  echo "$*"|aspell -a --suggest
}

# read markdown files like manpages
# https://github.com/xero/dotfiles/blob/master/zsh/.zsh/aliases.zsh
md () {
    pandoc -s -f markdown -t man "$*" | man -l -
}

# Method for quick change directories.
# http://grml.org/zsh/zsh-lovers.html
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# syntax highlight argument
# http://superuser.com/questions/84426/are-there-any-options-to-let-cat-output-with-color
ccat () {
  src-hilite-lesspipe.sh $1
}
