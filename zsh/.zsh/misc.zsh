# ┬─┐┬ ┐┌┐┐┌─┐┌┐┐o┌─┐┌┐┐┐─┐
# ├─ │ │││││   │ ││ ││││└─┐
# ┆  ┆─┘┆└┘└─┘ ┆ ┆┘─┘┆└┘──┘

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
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot


