# Autostart X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx ~/.xinitrc i3

# set path here 
# https://wiki.archlinux.org/index.php/Zsh#Configuring_.24PATH
typeset -U path
path=(~/bin $(ruby -rubygems -e "puts Gem.user_dir")/bin /usr/local/bin $HOME/.go/bin /perl5/bin ~/.npm/bin ~/.pip/bin ~/.cargo/bin $path[@])
# export PATH=$HOME/bin:$(ruby -rubygems -e "puts Gem.user_dir")/bin:/usr/local/bin:$HOME/.go/bin:$HOME/perl5/bin:$HOME/.npm/bin:$HOME/.pip/bin:$PATH

export BROWSER=firefox-developer

