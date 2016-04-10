#!/bin/env bash
# Wrapper script for dotfile playbooks using ansible.
# this is a work in progress. I havn't gotten all the kinks worked out of the current setup.
# Want to be able to use ansible itself but those calls quickly get quite unwieldy so decided to
# do the handling this way for now

# define playbook
playbook=$HOME/.dotfiles/dotfiles.yml

run () {
  (( $# >= 1 )) || usage
  case "$1" in
    "edit")
      if [[ -n "$2" ]]; then
        vim ~/.dotfiles/tasks/${2}.yml
      else
        usage
      fi
      ;;
    "vars")
      vim ~/.dotfiles/vars/$(hostname).yml
      ;;
    "help")
      usage
      ;;
    *)
      ansible-playbook $playbook -t ${1}
  esac
}

usage() {
	cat >&2 <<EOL
┳━┓┳━┓┏┓┓┳  o┏┓┓┳━┓
┣━ ┃━┫ ┃ ┃  ┃┃┃┃┣━
┇  ┛ ┇ ┇ ┇━┛┇┇┗┛┻━┛
-------------------
Simple wrapper for Ansible to facilitate using it as a dotfile manager

Usage: fatline command option

commands:
  no command            Run task/playbook with supplied name
  edit [option]         use vim to edit config task
  vars                  Edit current hosts vars
  help                  show help (this)
options:
  config-name           Name of app to setup

EOL
	exit 1
}



run "${@}"

#tags=$(ansible-playbook $playbook --list-tags)
#awk '
#BEGIN { print "START" }
#{ print $tags }
#END { print "STOP" }
#'

#echo "Select configuration to setup"
#select yn in "Yes" "No"; do
    #case $yn in
        #Yes ) make install; break;;
        #No ) exit;;
    #esac
#done
#ansible-playbook $playbook -t $@


