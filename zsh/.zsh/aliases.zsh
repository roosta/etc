# ------ Aliases ------ #

# always root
alias systemctl="sudo systemctl"
alias pacman="sudo pacman"
alias svim="sudo vim"
alias scat="sudo cat"

# alias sudo for easy access
alias _="sudo"

# long format and color ls output with various options. (see "man ls")
alias dir="ls -lAhpXk --color=auto --group-directories-first"

# output raw less output
alias less="less -r"

# quit aliases
alias :q="exit"
alias :Q="exit"

# ignore case in grep and color output
alias grep="grep -i --color=auto"

# vim aliases
alias vi="vim"

# utput from a command with xclip when this is piped in
alias copy='xclip -sel clip'

# quick edit conf files
alias gitconf="vim ~/.gitconfig"
alias i3conf="vim ~/.config/i3/config"
alias zshconf="vim ~/.zshrc"
alias vimconf="vim ~/.vimrc"
alias xrconf="vim ~/.Xresources"
alias hist="cat ~/.histfile | grep"

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

alias tarx="tar -zxvf"

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# get GPU ram on desktop / laptop
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias cd..='cd ..'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# fasd aliases
alias v='f -e vim' # quick opening files with vim

# Security aliases
# alias checkrootkits="sudo rkhunter --update; sudo rkhunter --propupd; sudo rkhunter --check"
alias checkvirus="clamscan --recursive=yes --infected /home"
alias updateantivirus="sudo freshclam"
