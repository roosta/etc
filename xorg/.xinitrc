#┌─────────────────────────────────────┐
#│░░░░░░░░░░█░█░▀█▀░█▀█░▀█▀░▀█▀░░░░░░░░│
#│░░░░░░░░░░▄▀▄░░█░░█░█░░█░░░█░░░░░░░░░│
#│░░░░░░░░░░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░░░░░░░░│
#├─────────────────────────────────────┤
#│ Author : Roosta <mail@roosta.sh>    │
#│ Site   : http://dotfiles.roosta.sh  │
#│ Github : https://github.com/roosta  │
#└─────────────────────────────────────┘

# ───────────── Autostart ──────────────
urxvtd -q -f -o &

# set extra font dir incase the various X font systems dont pick it up
xset +fp /usr/share/fonts/roosta &
xset fp rehash &

# set background with feh
$HOME/.fehbg &

# merge new resources
xrdb -merge $HOME/.Xresources &

# ─────────────── Inputs ───────────────
# Set keyboard layouts and options.
# Switch layout with caps and terminate x session with ctrl alt backspace
setxkbmap -model pc104 -layout us,no -option grp:caps_toggle -option terminate:ctrl_alt_bksp

# enable numlock at startup
numlockx

# bind various custom keys. see .xbindkeysrx
xbindkeys

#xboxdrv -D --config $HOME/.xboxdrv

# initially diable touchpad on laptop
#$HOME/.scripts/touchpad-toggle.sh

# ────────────── Displays ──────────────
# set display layout
#xrandr --output DVI-I-1 --primary --auto --pos 0x0 \
       #--output DVI-D-0 --auto --left-of DVI-I-1 \
       #--output HDMI-0 --off

xrandr --output VGA1 --primary --auto --pos 0x0 \
       --output LVDS1 --auto --left-of VGA1

# DPMS monitor setting (standby -> suspend -> off) (seconds)
#xset dpms 600 1200 2000 &

# screen locker
#xss-lock -- i3lock -n -e -d -t -i /usr/share/backgrounds/pattern-01.png &
xautolock -time 30 -locker "i3lock --dpms --ignore-empty-password --image=/usr/share/backgrounds/pattern-01.png --tiling" &

# ─────────── Window Manager ───────────
exec i3 -c $HOME/.i3/config.i3

# ─────────── Functions ───────────
#singleInstance() {
  #PID=$(pgrep $1)
  #if [[ -z "$PID" ]]; then
    #$(which $1)
  #fi
  #unset PID
#}
# vim:filetype=sh
