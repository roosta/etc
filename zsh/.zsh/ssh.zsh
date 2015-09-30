# ┌───────────────────────────────────────┐
# │░█▀▀░█▀▀░█░█░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░│
# │░▀▀█░▀▀█░█▀█░░░█░░░█░█░█░█░█▀▀░░█░░█░█░│
# │░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░│
# └───────────────────────────────────────┘

# Use gnome-keyring daemon for ssh keys
#if [ -n "$DESKTOP_SESSION" ];then
    #eval $(gnome-keyring-daemon --start)
    #export SSH_AUTH_SOCK
#fi

# use envoy as a ssh-agent wrapper
#envoy -t ssh-agent
#source <(envoy -p)

eval $(keychain --eval --quiet id_rsa --noask)

