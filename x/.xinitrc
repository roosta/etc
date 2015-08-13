# ┌─────────────────────┐
# │░█░█░▀█▀░█▀█░▀█▀░▀█▀░│
# │░▄▀▄░░█░░█░█░░█░░░█░░│
# │░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░│
# └─────────────────────┘
# Author : Roosta <mail@roosta.sh>
# Site   : http://dotfiles.roosta.sh
# Github : https://github.com/roosta
# ------

# merge new resources
xrdb -merge ~/.Xresources &

# start some daemons 
urxvtd -q -f -o &
powerline-daemon &

# bind fn keys on logitech wireless keyboard
xbindkeys &

# set extra font dir incase the various X font systems dont pick it up
xset +fp /usr/share/fonts/roosta &

# set background with feh
sh ~/.fehbg &

# set layout at x startup since logitech keyboard for some reason won't accept the xorg.conf...
setxkbmap -model pc104 -layout us,no -option grp:caps_toggle -option terminate:ctrl_alt_bksp &

xrandr --output DVI-D-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --off --output DVI-I-1 --mode 1920x1080 --pos 1920x0 --rotate normal 

# lanch mopidy (MPD)
mopidy &

# DPMS monitor setting (standby -> suspend -> off) (seconds)
xset dpms 600 1200 2000 &
#xset dpms 1200 & 

# start WM
exec i3

# 
#home/daniel/bin/touchpad-toggle &

# vim:filetype=sh
