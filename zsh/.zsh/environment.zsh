
#export MANPATH=/usr/local/man:$MANPATH
export PATH=$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:/usr/local/bin:$PATH

# set env to tell ranger not to use default config
export RANGER_LOAD_DEFAULT_RC="false"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
#export TERM=rxvt-unicode-256color

export EDITOR=vim
export VISUAL=vim

# use vimpager, and replace less
export PAGER=/usr/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

# fix display variable not beeing accessible with tty login...?
systemctl --user import-environment DISPLAY XAUTHORITY

#export LESS=-R
