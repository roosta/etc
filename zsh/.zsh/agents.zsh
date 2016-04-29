## GNUPG
## -----
# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi


## SSH
## ---
# start keychain. Remove --noask if you want to add a key on shell startup
eval $(keychain --eval --nogui --noask --agents ssh,gpg --quiet)

# Use gnome-keyring daemon for ssh keys
#if [ -n "$DESKTOP_SESSION" ];then
    #eval $(gnome-keyring-daemon --start)
    #export SSH_AUTH_SOCK
#fi

# use envoy as a ssh-agent wrapper
#envoy -t ssh-agent
#source <(envoy -p)

#keys="id_rsa"
#if [[ -e "$HOME/.ssh/lint@github" ]]; then
  #keys+=" lint@github"
#fi
#unset keys

