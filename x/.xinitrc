#┌─────────────────────────────────────┐
#│░░░░░░░░░░█░█░▀█▀░█▀█░▀█▀░▀█▀░░░░░░░░│
#│░░░░░░░░░░▄▀▄░░█░░█░█░░█░░░█░░░░░░░░░│
#│░░░░░░░░░░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░░░░░░░░│
#├─────────────────────────────────────┤
#│ Author : Roosta <contact@roosta.sh> │
#│ Site   : http://dotfiles.roosta.sh  │
#│ Github : https://github.com/roosta  │
#└─────────────────────────────────────┘

# ───────────── Autostart ────────────── 
# ──────────────────────────────────────

urxvtd -q -f -o &
powerline-daemon &
mopidy &

# set extra font dir incase the various X font systems dont pick it up
xset +fp /usr/share/fonts/roosta 
xset fp rehash

# set background with feh
sh ~/.fehbg &

# merge new resources
xrdb -merge ~/.Xresources &

# ─────────────── Inputs ─────────────── 
# ──────────────────────────────────────

# Set keyboard layouts and options. 
# Switch layout with caps and terminate x session with ctrl alt backspace 
setxkbmap -model pc104 -layout us,no -option grp:caps_toggle -option terminate:ctrl_alt_bksp

# enable numlock at startup
numlockx &

# bind various custom keys. see .xbindkeysrx 
xbindkeys 

# initially diable touchpad on laptop
#~/bin/touchpad-toggle

# ────────────── Displays ────────────── 
# ──────────────────────────────────────

# set display layout
xrandr --output DVI-I-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
       --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate normal \
       --output DP-1 --off --output HDMI-1 --off & 

# DPMS monitor setting (standby -> suspend -> off) (seconds)
xset dpms 600 1200 2000 &

# screen locker
xss-lock -- i3lock -n -e -d -t -i /usr/share/backgrounds/simple-55.png &

# ─────────── Window Manager ─────────── 
# ──────────────────────────────────────
exec i3

# vim:filetype=sh
