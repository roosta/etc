#!/bin/bash
# Used in window manager to instead of starting a new session on term
# shortcut it attach to an existing session and split the window.
# If none exist create a new one. This is a modified version of this:
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_in_urxvt
urxvtc -e bash -c "tmux -q has-session && exec tmux split-window -h \;
                   attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME"

#if [[ -z "$TMUX" ]] ;then
    #ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    #if [[ -z "$ID" ]] ;then # if not available create a new one
        #urxvtc -e bash -c tmux new-session -n$USER -s$USER@$HOSTNAME
    #else
        #urxvtc -e bash -c tmux attach-session -t "$ID" # if available attach to it
        #tmux split-windpw -h
    #fi
#fi

