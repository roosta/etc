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
alias vigit='vim ~/.gitconfig'
alias vii3='vim ~/.i3/config.i3'
alias vialias='vim ~/.zsh/aliases.zsh'
alias vivi='vim ~/.vimrc'
alias vivim='vim ~/.vimrc'
alias vixr='vim ~/.Xresources'
alias vitmux='vim ~/.tmux.conf'
alias vixinit='vim ~/.xinitrc'
alias vifont='vim ~/.config/fontconfig/fonts.conf'
alias vikeys='vim ~/.xbindkeysrc'

# ======= todo =======
# placeholder. write/find script
alias todo='vim ~/.todo'
alias lstodo='cat ~/.todo'

# ======= Quick list/find  =======
# locate an alias quickly
alias gra="alias | grep"

# grep command history quickly
alias greh="cat ~/.histfile | grep"

# echo path variable
alias lspath='echo -e ${PATH//:/\\n}'

# locate file at working dir
alias gref='lsa|grep'
alias grefr='lsa -R|grep'

# list pulseaudio sinks
alias lssink="pacmd list-sinks|egrep -i 'index:|name:'"

alias grehx='grep -R --include="*.hx"'

alias awk='gawk'

# ======= safety =======
alias mv=' timeout 8 mv -iv'
alias rm=' timeout 3 rm -Iv --one-file-system'
alias rmr='rm -r'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# get GPU ram on desktop / laptop
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# create parents, be verbose
alias mkdir='mkdir -pv'

# ======= Movement ========
# dirstack needs some extra config, see dirstack.sh
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
alias 10='cd -10'
alias 11='cd -11'
alias 12='cd -12'
alias 13='cd -13'
alias 14='cd -14'
alias 15='cd -15'
alias 16='cd -16'
alias 17='cd -17'
alias 18='cd -18'
alias 19='cd -19'

# long format and color ls output with various options. (see "man ls")
alias lsa="ls -lAhpXk --color=auto --group-directories-first"
alias dir='ls++ --potsf -lAhpXk'

# ======= Security =======
# -------------------
alias checkrootkits="sudo rkhunter --update && sudo rkhunter --propupd && sudo rkhunter --check --sk"
alias scanhome="sudo freshclam && clamscan -v --recursive=yes --infected /home"
alias scanroot="sudo freshclam && sudo clamscan -v --recursive=yes --infected /"
alias scanhere="sudo freshclam && sudo clamscan -v --recursive=yes --infected ."

# ======= Pacman =======
# source: https://wiki.archlinux.org/index.php/Pacman_tips
alias pacman='pacaur --color=auto' # use pacaur as a pacman extension
alias pacupd='pacman -Syu' # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl='pacman -Sw' # Download specified package(s) as .tar.xz ball
alias pacs='pacman -S' # Install specific package(s) from the repositories
alias pacu='pacman -U' # Install specific package not from the repositories but from a file
alias pacrm='pacman -R' # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrmf='pacman -Rns' # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacsi='pacman -Si' # Display information about a given package in the repositories
alias pacss='pacman -Ss' # Search for package(s) in the repositories
alias pacqi='pacman -Qi' # Display information about a given package in the local database
alias pacqs='pacman -Qs' # Search for package(s) in the local database
alias pacorph="pacman -Qdt" # List all packages which are orphaned
alias pacclean="pacman -Scc" # Clean cache - delete all the package files in the cache
alias pacls="pacman -Ql" # List all files installed by a given package
alias pacown="pacman -Qo" # Show package(s) owning the specified file(s)
alias pacmir='pacman -Syy' # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacexp='pacman -Qet' # list all packages explicitly installed and not required as dependencies
alias pacorphrm='pacman -Rns $(pacman -Qtdq)' # remove all orphaned packages
alias pacupdfull='pacman -Syu --devel' # update all packages including development packages
#alias pacexpl="pacman -D --asexp" # Mark one or more installed packages as explicitly installed
#alias pacimpl="pacman -D --asdep" # Mark one or more installed packages as non explicitly installed
#alias pacupre='pacman -Sy && sudo abs' # Update and refresh the local package and ABS databases against repositories
#alias pacinsd='pacman -S --asdeps' # Install given package(s) as dependencies

# AUR
# ------
#alias pacaur4='pacaur --domain aur4.archlinux.org'
#alias yaourt='pacaur'

# ======= Utils =======
alias grep="grep -i --color=auto" # ignore case in grep and color output
alias tarx="tar --one-top-level -zxvf" # extract tar to directory same as filename
alias ports='netstat -tulanp' # list open ports
alias pip='sudo -H pip' # set home variable when running pip
alias tmux='tmux -2'
alias ufw='sudo ufw'

# stow is always verbose
alias stow='stow -v'

# keep forgetting what these are called.
alias getkey='xev'
alias getclass='xprop'

# vi to vim
alias vi="vim"

# utput from a command with xclip when this is piped in
alias copy='xclip -sel clip'

# print date in various formats
alias gettime='date +"%T"'
alias getdatef='date +%Y-%m-%d_%H-%M-%S'
alias getdate='date +"%Y-%m-%d"'

alias locate='locate -i'

alias du='du -h'
alias df='df -h'
alias dut='du -ht'

alias logcolor='ccze'

# ======= VCS =======

alias diff='colordiff'

# --- git ---
alias gits='git status'
alias gitd='git diff'
alias gitout='git checkout'
alias gitls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gitll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gita='git add'
alias gitaa='git add -A'
alias gitc='git commit'
alias gitca='git commit -a'

# --- svn ---
alias svns='svn status'

# get last commit diff
alias svnlastdiff='svn log -r COMMITTED --diff'

# get a given rev's commit diff
alias svnrevdiff='svn log --diff -r'
alias svnupd='svn update'

alias svnls='svn log --limit 30|less'
alias svnll='svn log --diff --limit 30|less'
alias svndl='svn diff --git'
alias svnds='svn diff --summarize'
alias svnd='svn diff --no-diff-added -x -w'
alias svnundo='svn revert --recursive .'

# ======= MISC =======
# merge new xresources config
alias xrmerge="xrdb -merge ~/.Xresources"
alias xrload="xrdb -load ~/.Xresources"

# re-source zsh config files
alias zrefresh="source $HOME/.zshrc"

#alias _="sudo"

# quit aliases
alias :q="exit"
alias :Q="exit"

# common typo
alias claer='clear'

alias rmsteamlibs='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete'

alias repl='haxelib run ihx'


# ======= Paths =======
alias tl='/home/transform'
# find -name '*.hx' -print -exec sed -i.bak 's/import flash/import openfl/g' {} \;

alias gentags='ctags -R'

alias updatedb='sudo updatedb'
