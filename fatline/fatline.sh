#!/bin/env bash
# Wrapper script for dotfile playbooks using ansible.
# this is a work in progress. I havn't gotten all the kinks worked out of the current setup.
# Want to be able to use ansible itself but those calls quickly get quite unwieldy so decided to
# do the handling this way for now

playbook=$HOME/.dotfiles/dotfiles.yml

#echo "Select configuration to setup"
#select yn in "Yes" "No"; do
    #case $yn in
        #Yes ) make install; break;;
        #No ) exit;;
    #esac
#done
ansible-playbook $playbook -t $@
