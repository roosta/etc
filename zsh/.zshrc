# vim:ft=zsh:ts=2:sw=2
# ┌───────────────────────────────────────────────┐
# │█▀▀▀▀▀▀▀▀█░░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀░░░░█▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀█░░░░▄▀░░▀▀█░█▀█░█▀▄░█░░░░░░█▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀▀░░░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░░░░▀▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀▀───────────────────────────▀▀▀▀▀▀▀▀▀█│
# ├┤ Author : Roosta <mail@roosta.sh>            ├┤
# ├┤ Site   : http://dotfiles.roosta.sh          ├┤
# ├┤ Github : https://github.com/roosta          ├┤
# ┆├──────┬┬─────────────────────────────────────┤┆
#  ┆ info:├┘                                     ┆
# ┌───────┘
# │ Zsh config files. Configs are modularized in ~/.zsh/*
# │ Config is picked up here and there and crediting all the places I got snippets is a lost cause.
# ┆ But large thanks to Xero who's zsh conf influenced me the most and I'll add attribution where appropriate
# ┆ and/or where I can remember I got it from.
# └───────────────────────────────┬┬──────────────────────────── ── ── ─
#  thanks/help/inspiration/source:├┘
# ┌─┬─────────────────────────────┘
# ├─┤ https://github.com/xero/dotfiles
# ├─┤ https://dotfiles.github.io/
# ┆ ┆

## some options/scripts needs to be run prior to sourcing anything else
# set colors in virtual console from color resources
if [ "$TERM" = "linux" ]; then
  _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
  for i in $(sed -n "$_SEDCMD" $HOME/.colors/xcolors/gruvbox-dark.xresources | \
    awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
  echo -en "$i"
done
clear
fi

# start tmux on every shell login
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# source remaining config
for config (~/.zsh/*.zsh) source $config

# source fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
