#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/roosta/.byobu/prompt ] && . /home/roosta/.byobu/prompt   #byobu-prompt#

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
