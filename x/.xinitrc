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
# ──────────────────────────────────────

urxvtd -q -f -o &
mopidy &
#singleInstance(mopidy)

# set extra font dir incase the various X font systems dont pick it up
xset +fp /usr/share/fonts/roosta &
xset fp rehash &

# set background with feh
$HOME/.fehbg &

# merge new resources
xrdb -merge $HOME/.Xresources &

# ─────────────── Inputs ───────────────
# ──────────────────────────────────────

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
# ──────────────────────────────────────

# set display layout
xrandr --output DVI-I-1 --primary --auto --pos 0x0 \
       --output DVI-D-0 --auto --left-of DVI-I-1 \
       --output HDMI-0 --off

# DPMS monitor setting (standby -> suspend -> off) (seconds)
xset dpms 600 1200 2000 &

# screen locker
xss-lock -- i3lock -n -e -d -t -i /usr/share/backgrounds/simple-55.png &

# ─────────── Window Manager ───────────
# ──────────────────────────────────────
exec i3


# ─────────── Functions ───────────
# ─────────────────────────────────
#singleInstance() {
  #PID=$(pgrep $1)
  #if [[ -z "$PID" ]]; then
    #$(which $1)
  #fi
  #unset PID
#}
# vim:filetype=sh
