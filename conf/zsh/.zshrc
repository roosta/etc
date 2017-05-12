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

if [[ -s '/usr/share/doc/pkgfile/command-not-found.zsh' ]]; then
  source '/usr/share/doc/pkgfile/command-not-found.zsh'
# Return if requirements are not found.
else
  return 1
fi

if [[ -s "${plugin_location}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${plugin_location}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  return 1
fi

if [[ -s "${plugin_location}/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "${plugin_location}/zsh-history-substring-search/zsh-history-substring-search.zsh"
else
  return 1
fi

if [[ -s ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
else
  return 1
fi

# Unused ATM
# [ -f ~/.pip/bin/virtualenvwrapper.sh ] && source ~/.pip/bin/virtualenvwrapper.sh

# ZSH CONF
for config (~/.zsh.d/*.zsh) source $config

# PLUGIN CONF
# for cfg (~/.zsh.d/plugin_conf/*.zsh) source $cfg
hash fasd 2>/dev/null && source ~/.zsh.d/plugin_conf/fasd.zsh
hash fzf 2>/dev/null && source ~/.zsh.d/plugin_conf/fzf.zsh
source ~/.zsh.d/plugin_conf/ls_colors.zsh

# FUNCTIONS
# for function (~/.zsh.d/functions/*.zsh) source $function

