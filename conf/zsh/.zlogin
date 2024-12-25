# Autostart Sway at login
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then

  # https://github.com/swaywm/sway/wiki#xdg_current_desktop-environment-variable-is-not-being-set
  export XDG_CURRENT_DESKTOP="sway:wlroots"
  exec sway
fi

# Autostart X at login
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx ~/.xinitrc i3

