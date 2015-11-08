# Autostart X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx ~/.xinitrc i3
#[[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec startx ~/.xinitrc openbox

