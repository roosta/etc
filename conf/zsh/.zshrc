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
fi

if [[ -s "${plugin_location}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${plugin_location}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [[ -s "${plugin_location}/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "${plugin_location}/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

if [[ -s ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

# Unused ATM
# [ -f ~/.pip/bin/virtualenvwrapper.sh ] && source ~/.pip/bin/virtualenvwrapper.sh

function fload {
  local function_glob='^([_.]*|prompt_*_setup|README*|*~)(-.N:t)'
  fpath=($HOME/.zsh.d/functions $fpath)
  for function in ~/.zsh.d/functions/$~function_glob; do
    autoload -Uz "$function"
  done
  unset function
}

fload

# ZSH CONF
for config (~/.zsh.d/*.zsh) source $config

# PLUGIN CONF
# for cfg (~/.zsh.d/plugin_conf/*.zsh) source $cfg
hash fasd 2>/dev/null && source ~/.zsh.d/plugin_conf/fasd.zsh
hash fzf 2>/dev/null && source ~/.zsh.d/plugin_conf/fzf.zsh
source ~/.zsh.d/plugin_conf/ls_colors.zsh


