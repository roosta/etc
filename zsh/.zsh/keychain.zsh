
#eval $(ssh-agent)

#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# add private key to agent once its needed
#ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

# use keychain as a ssh front-end
eval $(keychain --eval --nogui --agents ssh -Q --quiet id_rsa)

