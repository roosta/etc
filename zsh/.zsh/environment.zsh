# ┌──────────────────────────────────────────────────┐
# │░░░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▄█░█▀▀░█▀█░▀█▀░░░░│
# │░░░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░░░░░│
# │░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░░░░░│
# └──────────────────────────────────────────────────┘

#export MANPATH=/usr/local/man:$MANPATH

# set env to tell ranger not to use default config
export RANGER_LOAD_DEFAULT_RC="false"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
#export TERM="xterm-256"

export DESKTOP_SESSION=gnome
export QT_STYLE_OVERRIDE=GTK+
export EDITOR=vim
export VISUAL=vim

export GOPATH=$HOME/.go

export ZSH_CACHE_DIR=$HOME/.cache/zsh

# use vimpager, and replace less
export PAGER=/usr/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

# fix display variable not beeing accessible with tty login...?
#systemctl --user import-environment DISPLAY XAUTHORITY

export PATH=$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:/usr/local/bin:$HOME/.go/bin:$PATH

export LESS=-R
