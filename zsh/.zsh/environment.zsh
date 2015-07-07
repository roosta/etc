
#export MANPATH=/usr/local/man:$MANPATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# set env to tell ranger not to use default config
export RANGER_LOAD_DEFAULT_RC="false"

export LANG=en_US.UTF-8
export TERM=rxvt-unicode-256color

export EDITOR=vim
export VISUAL=vim

export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')

#export PENTADACTYL_RUNTIME=~/.pentadactyl
