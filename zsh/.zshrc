# vim:ft=zsh:ts=2:sw=2
# ┌───────────────────────────────────────────────┐
# │█▀▀▀▀▀▀▀▀█░░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀░░░░█▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀█░░░░▄▀░░▀▀█░█▀█░█▀▄░█░░░░░░█▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀▀░░░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░░░░▀▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀▀───────────────────────────▀▀▀▀▀▀▀▀▀█┘
# ├┤ Author : Roosta <mail@roosta.sh>   ┌────────┘
# ├┤ Site   : http://dotfiles.roosta.sh │
# ├┤ Github : https://github.com/roosta │
# ┆├──────┬┬────────────────────────────┘
#  ┆ info:├┘
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
for config (~/.zsh/*.zsh) source $config # ─┬┐
# ──────────────────────────────────────────┘┆
# ┌─┐┌─┐┬─┐┌┐┐
# ┌─┘│ ┬├─ │││
# └─┘┆─┘┴─┘┆└┘
# ─────────┘
source "${HOME}/.zsh/zgen/zgen.zsh"
if ! zgen saved; then
  echo "Creating a zgen save"
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-history-substring-search
  zgen load mafredri/zsh-async
  zgen load $HOME/projects/pure
  zgen save
fi
# ┬─┐┬─┐┐─┐┬─┐
# ├─ │─┤└─┐│ │
# ┆  ┘ ┆──┘┆─┘
# ─────────┘
# https://github.com/clvv/fasd
# Installed from AUR
eval "$(fasd --init auto)"
# ┬  ┐─┐   ┌─┐┌─┐┬  ┌─┐┬─┐┐─┐
# │  └─┐   │  │ ││  │ ││┬┘└─┐
# ┆─┘──┘───└─┘┘─┘┆─┘┘─┘┆└┘──┘
# ─────────────────────┘
# https://github.com/trapd00r/LS_COLORS
eval $( dircolors -b $HOME/.dircolors )
# ┬─┐┌─┐┬─┐
# ├─ ┌─┘├─
# ┆  └─┘┆
# ──────┘
# plugin handled externally with vim-plug
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

