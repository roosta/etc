# vim:ft=sh
#┌─────────────────────────────────────┐
#│░░░░░░░░░░█░█░▀█▀░█▀█░▀█▀░▀█▀░░░░░░░░│
#│░░░░░░░░░░▄▀▄░░█░░█░█░░█░░░█░░░░░░░░░│
#│░░░░░░░░░░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░░░░░░░░│
#├─────────────────────────────────────┤
#│ Author : Roosta <mail@roosta.sh>    │
#│ Site   : http://dotfiles.roosta.sh  │
#│ Github : https://github.com/roosta  │
#└─────────────────────────────────────┘

# Ｉｎｉｔ
# ────────
# do this on startup for good measure :)
xset +fp $HOME/.local/share/fonts/roosta &
xset fp rehash &

# set background with feh
$HOME/.fehbg &

# merge new resources
xrdb -merge $HOME/.Xresources &

# Ｉｎｐｕｔｓ
# ────────────
# Set keyboard layouts and options.
# Switch layout with caps and terminate x session with ctrl alt backspace
setxkbmap -model pc104 -layout us,no -option grp:caps_toggle -option terminate:ctrl_alt_bksp &

# enable numlock at startup
numlockx &

# bind various custom keys. see .xbindkeysrx
xbindkeys &

# xbox controller drivers. Currently using steamos-xpad
#xboxdrv -D --config $HOME/.xboxdrv

# initially diable touchpad on laptop
#$HOME/.scripts/touchpad-toggle.sh

# Ｄｉｓｐｌａｙ
# ──────────────
# set display layout
xrandr --output DVI-I-1 --primary --auto --pos 0x0 \
       --output DVI-D-0 --auto --left-of DVI-I-1 \
       --output HDMI-0 --off &

# screen locker
xss-lock -- xscreensaver-command -lock &

# disable screensaver when certain fullscreen apps are active
# see https://github.com/iye/lightsOn/blob/master/lightsOn.sh
$home/bin/lightsOn 590 &

# DPMS monitor setting (standby -> suspend -> off) (seconds)
#xset dpms 600 1200 2000 &
#xss-lock -- i3lock -n -e -d -t -i /usr/share/backgrounds/pattern-01.png &
#xautolock -time 30 -locker "i3lock --dpms --ignore-empty-password --image=$HOME/.backgrounds/pattern-01.png --tiling" &

# Ｄａｅｍｏｎｓ
# ──────────────
urxvtd -q -f -o &
seaf-cli start &
compton --config $HOME/.config/compton/compton.conf -b &
xscreensaver -no-splash &

# Ｗｉｎｄｏｗ  ｍａｎａｇｅｒ
# ────────────────────────────
exec i3 -c $HOME/.i3/i3.config

