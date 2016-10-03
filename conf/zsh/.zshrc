# vim:ft=zsh:ts=2:sw=2
# ┌───────────────────────────────────────────────┐
# │█▀▀▀▀▀▀▀▀█░░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀░░░░█▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀█░░░░▄▀░░▀▀█░█▀█░█▀▄░█░░░░░░█▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀▀░░░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░░░░▀▀▀▀▀▀▀▀▀█│
# │█▀▀▀▀▀▀▀▀▀───────────────────────────▀▀▀▀▀▀▀▀▀█│
# ├┤ Author : Roosta <mail@roosta.sh>            ├┤
# ├┤ Site   : http://dotfiles.roosta.sh          ├┤
# ├┤ Github : https://github.com/roosta          ├┤
# ┆└───────────────────────────────────────┬┬┬┬┬─┤┆
# │ Zsh run commands.                      ├┤┆├┴─┤
# │                                      ┌─┼┼─┤  ┆
# └──────────────────────────────────────┴─┴┴─┤
#                                             ┆
# VIRTUAL CONSOLE
if [ "$TERM" = "linux" ]; then
  _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
  for i in $(sed -n "$_SEDCMD" $HOME/.Xresources.d/srcery.xresources | \
    awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
  echo -en "$i"
done
clear
tmux new-session -s vconsole
fi

# init completion
# for compl (~/.zsh.d/completion/*.zsh) source $compl

# CONF
for config (~/.zsh.d/*.zsh) source $config
for cfg (~/.zsh.d/plugin_conf/*.zsh) source $cfg

# FUNCTIONS
for function (~/.zsh.d/functions/*.zsh) source $function

# PLUGINS
plugin_location=$HOME/.zsh.d/plugins
[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -f $plugin_location/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source $plugin_location/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f $plugin_location/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $plugin_location/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

