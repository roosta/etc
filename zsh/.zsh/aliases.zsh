# ┌──────────────────────────────┐
# │░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀░░│
# │░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█░░│
# │░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░│
# └──────────────────────────────┘
# Author : Roosta <contact@roosta.sh>
# Site   : http://dotfiles.roosta.sh
# Github : https://github.com/roosta
# -------------------------------

# ======= Quick edits ======= 
# ---------------------------
alias vigit='vim ~/.gitconfig'
alias vii3='vim ~/.i3/config'
alias vialias='vim ~/.zsh/aliases.zsh'
alias vivi='vim ~/.vimrc'
alias vixr='vim ~/.Xresources'
alias vitmux='vim ~/.tmux.conf'
alias vixinit='vim ~/.xinitrc'
alias vifont='vim ~/.config/fontconfig/fonts.conf'
alias vikeys='vim ~/.xbindkeysrc'

# ======= todo ======= 
# placeholder. write/find script
# --------------------
alias todo='vim ~/.todo'
alias lstodo='cat ~/.todo'


# ======= Quick grep =======
# --------------------------

# locate an alias quickly
alias galias="alias | grep"

# grep command history quickly
alias ghist="cat ~/.histfile | grep"

# create parents as needed, verbose
alias mkdir='mkdir -pv'

# echo path variable
alias path='echo -e ${PATH//:/\\n}'

# ======= safety =======
# ----------------------
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# get GPU ram on desktop / laptop
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# ======= Movement ========
# dirstack needs some extra config, see dirstack.sh
#-------------------------- 
alias cd..='cd ..'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# dirstack control
alias stack='dirs -v'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# long format and color ls output with various options. (see "man ls")
alias lsa="ls -lAhpXk --color=auto --group-directories-first"
alias dir='ls++ --potsf -lAhpXk'

# ======= Security =======
# -------------------
alias checkrootkits="sudo rkhunter --update && sudo rkhunter --propupd; sudo rkhunter --check"
alias scanhome="sudo freshclam && clamscan -v --recursive=yes --infected /home"
alias scanroot="sudo freshclam && sudo clamscan -v --recursive=yes --infected /"

# ======= Pacman =======
# source: https://wiki.archlinux.org/index.php/Pacman_tips
# ----------------------

# use pacaur as a pacman extension
alias pacman='pacaur'

# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacupdate='pacman -Syu'

# Download specified package(s) as .tar.xz ball
alias pacdl='pacman -Sw'

# Install specific package(s) from the repositories
alias pacinst='pacman -S'

# Install specific package not from the repositories but from a file 
alias pacins='pacman -U'

# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrm='pacman -R'

# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrmf='pacman -Rns'

# Display information about a given package in the repositories
alias pacinfo='pacman -Si'

# Search for package(s) in the repositories
alias paclook='pacman -Ss'

# Display information about a given package in the local database
alias paclinfo='pacman -Qi'

# Search for package(s) in the local database
alias paclsearch='pacman -Qs'

# List all packages which are orphaned
alias pacorph="pacman -Qdt"

# Clean cache - delete all the package files in the cache
alias pacc="pacman -Scc"

# List all files installed by a given package
alias pacls="pacman -Ql"

# Show package(s) owning the specified file(s)
alias pacown="pacman -Qo"

# Mark one or more installed packages as explicitly installed 
#alias pacexpl="pacman -D --asexp"	

# Mark one or more installed packages as non explicitly installed
#alias pacimpl="pacman -D --asdep"

# Additional pacman alias examples
# --------------------------------

# Update and refresh the local package and ABS databases against repositories
alias pacupre='pacman -Sy && sudo abs'

# Install given package(s) as dependencies
alias pacinsd='pacman -S --asdeps'

# Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacmir='pacman -Syy'

# AUR
# ------

alias pacaur4='pacaur --domain aur4.archlinux.org'
#alias yaourt='pacaur'

# ======= Utils =======
# -----------------
alias tarx="tar -zxvf"

# list open ports
alias ports='netstat -tulanp'

# set home variable when running pip
alias pip='sudo -H pip'


# ======= VCS =======
# -------------------

# git
alias gstat='git status'
alias gdiff='git diff'
alias gcheck='git checkout'
alias gcoma='git commit -a'
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias glsa='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gadda'git add -A'

## transform
alias sst='svn status'

# ======= MISC =======
# --------------------

alias tmux='tmux -2'
alias ufw='sudo ufw'
alias music='urxvt -e ncmpcpp'

# stow is always verbose
alias stow='stow -v'

# merge new xresources config
alias xrmerge="xrdb -merge ~/.Xresources"

# refresh zsh config files
alias zrefresh="source $HOME/.zshrc"

alias lssinks="pacmd list-sinks|egrep -i 'index:|name:'"

# always root
alias svim="sudo vim"
alias scat="sudo cat"

# alias sudo for easy access
alias _="sudo"

# quit aliases
alias :q="exit"
alias :Q="exit"

# ignore case in grep and color output
alias grep="grep -i --color=auto"

# common typo
alias claer='clear'

# keep forgetting what these are called. 
alias keypress='xev'
alias getclass='xprop'

# vi to vim 
alias vi="vim"

# utput from a command with xclip when this is piped in
alias copy='xclip -sel clip'

# print date in various formats 
alias gettime='date +"%T"'
alias fdate='date +%Y-%m-%d_%H-%M-%S'
alias getdate='date +"%Y-%m-%d"'

# locate file at .
alias gfile='lsa|grep'
