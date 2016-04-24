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
# │ Zsh run commands. Configs are split in ~/.zsh/*.zsh
# └───────────────────────────────┬┬──────────────────────────── ── ── ─
#  thanks/help/inspiration/source ├┘
# ┌─┬─────────────────────────────┘
# ├─┤ https://github.com/xero/dotfiles
# ├─┤ https://dotfiles.github.io/
# ┆ ┆

# set colors and start tmux for tty
if [ "$TERM" = "linux" ]; then
  _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
  for i in $(sed -n "$_SEDCMD" $HOME/colors/xcolors/gruvbox-dark.xresources | \
    awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
  echo -en "$i"
done
clear
tmux new-session -s vconsole
fi

# forcibly set color palette
# https://github.com/morhetz/gruvbox/wiki/Terminal-specific
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# source user completion
for compl (~/.zsh/completion/*.zsh) source $compl

# source user conf
for config (~/.zsh/*.zsh) source $config

# see vim-fzf plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
