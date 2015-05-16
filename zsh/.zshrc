# Lines configured by zsh-newuser-install
#
#
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable powerline
. /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh

# set key bindings (e = emacs, v = vi)
bindkey -v

# ------ Aliases ------ #

# long format and color ls output with various options. (see "man ls")
alias dir="ls -lAhpXk --color=auto --group-directories-first"

alias less="less -r"

# ignore case in grep and color output
alias grep="grep -i --color=auto"

# alias sudo for easy access
alias _="sudo"

# alias vi to vim
alias vi="vim"

# quick edit conf files 
# utput from a command with xclip when this is piped in
alias copy='xclip -sel clip'

alias i3conf="vim ~/.i3/config"
alias zshconf="vim ~/.zshrc"
alias vimconf="vim ~/.vimrc"   

# create parents as needed, verbose
alias mkdir='mkdir -pv'

# echo path variable
alias path='echo -e ${PATH//:/\\n}'

# output time
alias now='date +"%T"'
alias nowtime=now

# output current date
alias nowdate='date +"%d-%m-%Y"'

# list open ports
alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
 
# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Get server cpu info
alias cpuinfo='lscpu'

# get GPU ram on desktop / laptop
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# end aliases ---/

