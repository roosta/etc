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
# │                                        ├┤┆├┴─┤
# │                                      ┌─┼┼─┤  ┆
# └──────────────────────────────────────┴─┴┴─┤
#                                             ┆
# VIRTUAL CONSOLE
# Set colors by parsing xresources (or attempt to, not working. Will fix eventually)
# Also start a tmux session
if [ "$TERM" = "linux" ]; then
  _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
  for i in $(sed -n "$_SEDCMD" $HOME/.Xresources.d/srcery.xresources | \
    awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
  echo -en "$i"
done
clear
tmux new-session -s vconsole
fi

# PLUGINS
plugin_location=$HOME/.zsh.d/plugins
command_not_found=/usr/share/doc/pkgfile/command-not-found.zsh
[ -f $command_not_found ] && source $command_not_found

zsh_syntax_highlighting=$plugin_location/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f $zsh_syntax_highlighting ] && source $zsh_syntax_highlighting

zsh_history_substring_search=$plugin_location/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f $zsh_history_substring_search ] && source $zsh_history_substring_search

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Unused ATM
# [ -f ~/.pip/bin/virtualenvwrapper.sh ] && source ~/.pip/bin/virtualenvwrapper.sh

# PLUGIN CONF
# for cfg (~/.zsh.d/plugin_conf/*.zsh) source $cfg
hash fasd 2>/dev/null && source ~/.zsh.d/plugin_conf/fasd.zsh
hash fzf 2>/dev/null && source ~/.zsh.d/plugin_conf/fzf.zsh
source ~/.zsh.d/plugin_conf/ls_colors.zsh

# ZSH CONF
for config (~/.zsh.d/*.zsh) source $config

# FUNCTIONS
for function (~/.zsh.d/functions/*.zsh) source $function

