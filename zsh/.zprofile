# Autostart X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

#source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
