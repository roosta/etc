# Start gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# merge new resources
xrdb -merge ~/.Xresources

# start WM
exec i3
