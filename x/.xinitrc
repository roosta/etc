#┌─────────────────────────────────────┐
#│█▀▀▀▀▀█░░█░█░▀█▀░█▀█░▀█▀░▀█▀░░█▀▀▀▀▀█│
#│█▀▀▀▀▀█░░▄▀▄░░█░░█░█░░█░░░█░░░█▀▀▀▀▀█│
#│█▀▀▀▀▀▀░░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░░▀▀▀▀▀▀█│
#│█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█│
#│█ author: roosta <mail@roosta.sh>   █│
#│█ site  : http://dotfiles.roosta.sh █│
#│█ github: https://github.com/roosta █│
#└───────────┬─────────────────────────┘
# ┌──────────┘
# │ o┌┐┐o┌┐┐o┬─┐┬  o┌─┐┬─┐
# │ │││││ │ ││─┤│  │┌─┘├─
# ┆ ┆┆└┘┆ ┆ ┆┘ ┆┆─┘┆└─┘┴─┘

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
hostconf=$HOME/.dotfiles/x/xinitrc.d/$(hostname)

# merge in defaults and keymaps
if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# execute host based config
if [ -x $hostconf ] ; then
  . "$hostconf"
fi

# set X font locations
xset +fp $HOME/.fonts/restricted &
xset +fp $HOME/.fonts/misc &
xset fp rehash &

# o┌┐┐┬─┐┬ ┐┌┐┐┐─┐
# │││││─┘│ │ │ └─┐
# ┆┆└┘┆  ┆─┘ ┆ ──┘

# Set keyboard layouts and options.
# Switch layout with caps and terminate x session with ctrl alt backspace
setxkbmap -model pc104 -layout us,no -option grp:caps_toggle -option terminate:ctrl_alt_bksp &

# enable numlock at startup
numlockx &

# bind various custom keys. see .xbindkeysrx
xbindkeys &

# ┬─┐o┐─┐┬─┐┬  ┬─┐┐ ┬
# │ ││└─┐│─┘│  │─┤└┌┘
# ┆─┘┆──┘┆  ┆─┘┘ ┆ ┆

# screen locker
xss-lock -- xscreensaver-command -lock &

# disable screensaver when certain fullscreen apps are active
# see https://github.com/iye/lightsOn/blob/master/lightsOn.sh
$HOME/bin/lightsOn 590 &

# load nvidia-settings on startup
nvidia-settings --load-config-only &

# set background with feh
$HOME/.fehbg &

# ┬─┐┬─┐┬─┐┌┌┐┌─┐┌┐┐┐─┐
# │ ││─┤├─ ││││ ││││└─┐
# ┆─┘┘ ┆┴─┘┘ ┆┘─┘┆└┘──┘

urxvtd -q -f -o &
compton -b &
xscreensaver -no-splash &
dunst &
dropbox &

# ┐ ┬o┌┐┐┬─┐┌─┐┐ ┬  ┌┌┐┬─┐┌┐┐┬─┐┌─┐┬─┐┬─┐
# ││││││││ ││ ││││  ││││─┤││││─┤│ ┬├─ │┬┘
# └┴┆┆┆└┘┆─┘┘─┘└┴┆  ┘ ┆┘ ┆┆└┘┘ ┆┆─┘┴─┘┆└┘

# easy wm-switcher, given arg from ~/.xserverrc
# https://wiki.archlinux.org/index.php/Xinitrc#Making_a_DE.2FWM_choice
session=${1:-i3} # Here i3wm is kept as default
case $session in
  awesome           ) exec awesome;;
  bspwm             ) exec bspwm;;
  catwm             ) exec catwm;;
  cinnamon          ) exec cinnamon-session;;
  dwm               ) exec dwm;;
  enlightenment     ) exec enlightenment_start;;
  ede               ) exec startede;;
  fluxbox           ) exec startfluxbox;;
  gnome             ) exec gnome-session;;
  gnome-classic     ) exec gnome-session --session=gnome-classic;;
  i3|i3wm           ) exec i3 -c $HOME/.i3/config.gen --shmlog-size=26214400;;
  icewm             ) exec icewm-session;;
  jwm               ) exec jwm;;
  kde               ) exec startkde;;
  mate              ) exec mate-session;;
  monster|monsterwm ) exec monsterwm;;
  notion            ) exec notion;;
  openbox           ) exec openbox-session;;
  unity             ) exec unity;;
  xfce|xfce4        ) exec startxfce4;;
  xmonad            ) exec xmonad;;
  # No known session, try to run it as command
  *) exec $1;;
esac

# vim:ft=sh:ts=2:sw=2:fdm=marker
