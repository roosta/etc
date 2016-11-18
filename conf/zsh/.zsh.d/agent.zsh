## GPG AGENT SETUP + SSH
# https://wiki.archlinux.org/index.php/GnuPG#SSH_agent
## ---

# Start the gpg-agent if not already running
#if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  #gpg-connect-agent /bye >/dev/null 2>&1
#fi


## Set SSH to use gpg-agent
#unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  #export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
#fi

## Set GPG TTY
#export GPG_TTY=$(tty)

## Refresh gpg-agent tty in case user switches into an X session
#gpg-connect-agent updatestartuptty /bye >/dev/null

## KEYCHAIN
## SSH
## ---
# start keychain. Remove --noask if you want to add a key on shell startup
eval $(keychain --eval --nogui --noask --agents ssh,gpg --quiet --timeout 30)

 #use envoy as a ssh-agent wrapper
#envoy -t ssh-agent
#source <(envoy -p)

#keys="id_rsa"
#if [[ -e "$HOME/.ssh/lint@github" ]]; then
  #keys+=" lint@github"
#fi
#unset keys



