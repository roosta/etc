# Start gnome keyring
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

# merge new resources
xrdb -merge ~/.Xresources

# start urxvt daemon on login
urxvtd -q -f -o

# init powerline
powerline-daemon

setxkbmap -layout no
xrandr --output VGA1 --right-of LVDS1

# start WM
exec i3

