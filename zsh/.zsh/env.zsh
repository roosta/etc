# ┌──────────────────────────────────────────────────┐
# │░░░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▄█░█▀▀░█▀█░▀█▀░░░░│
# │░░░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░░░░░│
# │░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░░░░░│
# └──────────────────────────────────────────────────┘

# set paths.
export PATH=$HOME/bin:$HOME/.gem/ruby/2.2.0/bin:/usr/local/bin:$HOME/.go/bin:$HOME/perl5/bin:$PATH
#export MANPATH=/usr/local/man:$MANPATH

fpath=("$HOME/.zsh.d" $fpath)

# locate
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM="xterm-256color"
export TERMINAL=urxvtc

# uniform qt/gtk look.
export DESKTOP_SESSION=gnome
export QT_STYLE_OVERRIDE=GTK+

# editor
export EDITOR=vim
export VISUAL=vim

# golang lib path
export GOPATH=$HOME/.go

export ZSH_CACHE_DIR=$HOME/.cache/zsh

# use vimpager, and replace less
export PAGER=/usr/bin/vimpager
export LESS=-R

# alias less to vim pager
alias less=$PAGER
alias zless=$PAGER

export STEAM_RUNTIME=0

# set env to tell ranger not to use default config
export RANGER_LOAD_DEFAULT_RC="false"

# https://wiki.archlinux.org/index.php/NVIDIA#Gaming_using_TwinView
# attempt to fix vsync issue with nvidia multiple displays
export SDL_VIDEO_FULLSCREEN_HEAD=1
export __GL_SYNC_TO_VBLANK=1
export __GL_SYNC_DISPLAY_DEVICE=DFP-0
export __VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DFP-0
#
# cpan stuff
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

