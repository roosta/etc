# ┌───────────────────────────────────────────┐
# │▀▀▀░░░░░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀░░░░░▀▀▀│
# │▀▀▀▀░░░░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█░░░░▀▀▀▀│
# │█▀▀▀▀▀░░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░▀▀▀▀▀█│
# │█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█│
# │█░░  Author : Roosta <mail@roosta.sh>   ░░█│
# │█░░  Site   : http://dotfiles.roosta.sh ░░█│
# │█░░  Github : https://github.com/roosta ░░█│
# └───────────┬───────────────────────────────┘
#  thanks to: │
# ┌───────────┘
# │ ┐ ┬o┌┌┐
# │ │┌┘││││
# ┆ └┘ ┆┘ ┆

alias vi="vim"

# quick edits
alias vigit="vim ~/.gitconfig"
alias vissh="vim ~/.ssh/config"
alias vii3="vim ~/.i3/config.j2"
alias vialias="vim ~/.zsh/aliases.zsh"
alias vivim="vim ~/.vimrc"
alias vixres="vim ~/.Xresources"
alias vitmux="vim ~/.tmux.conf"
alias vixinit="vim ~/.xinitrc"
alias vifont="vim ~/.config/fontconfig/fonts.conf"
alias vibinds="vim ~/.xbindkeysrc"
alias vivimp="vim ~/.vimperatorrc"
alias vigtk="vim ~/.gtkrc-2.0 ~/.config/gtk-3.0/settings.ini"
alias vivimp="vim ~/.vimperatorrc"
alias vilein="vim ~/.lein/profiles.clj"
alias viterm="vim ~/.urxvt.xresources"
alias vime="vim ~/.dotfiles/vars/$(hostname).yml"
alias vii3tmp="vim ~/.i3/config.gen"
alias vienv="vim ~/.zsh/env.zsh"

# ┬─┐o┌┐┐┬─┐
# ├─ │││││ │
# ┆  ┆┆└┘┆─┘

alias ag="ag -i --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias grep="ag"

alias galias="cat ~/.zsh/aliases.zsh | grep" # locate an alias quickly
alias ghist="cat ~/.histfile | grep" # grep command history quickly
alias gproc="ps -aux|grep" # grep processes
alias lspath='echo -e ${PATH//:/\\n}' # echo path variable

# locate file at working dir
alias gls='lsa | grep'
alias glsr='lsa -R | grep'

# list pulseaudio sinks
alias lssink="pacmd list-sinks|egrep -i 'index:|name:'"

# recursive grep through filetypes
alias greclj='grep -R --include="*.clj*"'

# yes
alias awk='gawk'

# ┐─┐┬─┐┬─┐┬─┐┌┐┐┐ ┬
# └─┐│─┤├─ ├─  │ └┌┘
# ──┘┘ ┆┆  ┴─┘ ┆  ┆

alias mv=' timeout 8 mv -iv'
alias rm=' timeout 3 rm -Iv --one-file-system'
alias rmr='rm -r'
alias rmrf="rm -rf"
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

# ┌┌┐┌─┐┐ ┬┬─┐┌┌┐┬─┐┌┐┐┌┐┐
# ││││ ││┌┘├─ │││├─ │││ │
# ┘ ┆┘─┘└┘ ┴─┘┘ ┆┴─┘┆└┘ ┆

alias cd..='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

## dirstack movement: needs some extra config, see dirstack.sh
alias dirs='dirs -v'
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

# lists
alias lsa="\ls -lAhpk --color=auto --group-directories-first"
alias ls='ls++ -lAhpk'
#alias dir='ls'
alias lsr='ls -R'
alias lsp='lsp -p'

# ┐─┐┬─┐┌─┐┬ ┐┬─┐o┌┐┐┐ ┬
# └─┐├─ │  │ ││┬┘│ │ └┌┘
# ──┘┴─┘└─┘┆─┘┆└┘┆ ┆  ┆

alias checkrootkits="sudo rkhunter --update && sudo rkhunter --propupd && sudo rkhunter --check --sk"
alias scanhome="sudo freshclam && clamscan -v --recursive=yes --infected -l /home/roosta/.tmp/clamscan.log $HOME"
alias scanroot="sudo freshclam && sudo clamscan -v --recursive=yes --infected -l /home/roosta/.tmp/clamscan.log $HOME /"
alias scanhere="sudo freshclam && sudo clamscan -v --recursive=yes --infected -l /home/rootsa/.tmp/clamscan.log $HOME ."

# ┬─┐┬─┐┌─┐┌┌┐┬─┐┌┐┐
# │─┘│─┤│  ││││─┤│││
# ┆  ┘ ┆└─┘┘ ┆┘ ┆┆└┘

# source: https://wiki.archlinux.org/index.php/Pacman_tips
alias pacman='yaourt' # use yaourt as a pacman wrapper

# Installing
alias pacs="pacman -S" # Install specific package(s) from the repositories
alias pacss="pacman -Ss" # Search for package(s) in the repositories
alias pacdl="pacman -Sw" # Download specified package(s) as .tar.xz ball
alias pacupre="pacman -Sy && abs" # Update and refresh the local package and ABS databases against repositories
alias pacinsd="pacman -S --asdeps" # Install given package(s) as dependencies
alias pacu="pacman -U" # Install specific package not from the repositories but from a file

# cleaning
alias pacrm="pacman -R" # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrmf="pacman -Rns" # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacclean="pacman -Scc" # Clean cache - delete all the package files in the cache

# orphans
alias pacorm="pacman -Rns $(pacman -Qtdq)" # remove all orphaned packages
alias paco="pacman -Qdt" # List all packages which are orphaned

# query
alias pacqs="pacman -Qs" # Search for package(s) in the local database
alias pacqi="pacman -Qi" # Display information about a given package in the local database

# lists/info
alias pacsi="pacman -Si" # Display information about a given package in the repositories
alias pacls="pacman -Qet" # list all packages explicitly installed and not required as dependencies
alias paclss="pacman -Ql" # List all files installed by a given package
alias paclsl="pacman -Qen" # list all packages from official repos
alias pacals="pacman -Qem" # list explicit packages not from official repos
alias pacown="pacman -Qo" # Show package(s) owning the specified file(s)

# mark
alias pacexpl="pacman -D --asexp" # Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep" # Mark one or more installed packages as non explicitly installed

# Updating
alias pacupd="pacman -Syu" # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacupdf="pacman -Syua --noconfirm"
alias pacupdff="pacman -Syua --noconfirm --devel"
alias getmirror="sudo curl -o /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/all/" # get country sorted mirrorlist to use with reflector
alias pacmirupd="sudo reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syy" # use reflector to sort the 5 fastest mirrors and force update
alias pacmir="pacman -Syy" # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# ┬ ┐┌┐┐o┬  ┐─┐
# │ │ │ ││  └─┐
# ┆─┘ ┆ ┆┆─┘──┘

alias watchff="watch progress -wc firefox" # watch firefox download progress.
alias tarx="tar --one-top-level -zxvf" # extract tar to directory same as filename
alias ports="netstat -tulanp" # list open ports
alias pip="sudo -H pip" # set home variable when running pip
alias tmux="tmux -2"
alias ufw="sudo ufw"
alias make="colormake"

# https://github.com/xero/dotfiles/blob/master/zsh/.zsh/aliases.zsh
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'

# stow is always verbose
alias stow="stow -v"

# keep forgetting what these are called.
alias getclass="xprop"
alias getkey="xev -event keyboard"
#alias getkeycode=xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
alias logcolor="ccze"

# utput from a command with xclip when this is piped in
#alias copy='xsel -i -p -b'
alias copy="clipcopy" # see functions

# print date in various formats
alias gettime='date +"%T"'
alias getdatef='date +%Y-%m-%d@%H-%M-%S'
alias getdate='date +"%Y-%m-%d"'

# ignore case always
alias locate='locate -i'

# print du/df tallies in human readable
alias du='du -h'
alias df='df -h'
alias dut='du -ht'

alias updatedb='sudo updatedb'
alias xfontsel='xfontsel -print|clipcopy'

alias ~~="$HOME/.backup/home/$USER"
alias tasks="task"

alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'
alias ascii="toilet -t -f 3d"
alias future="toilet -t -f future"
alias rusto="toilet -t -f rusto"
alias rustofat="toilet -t -f rustofat"
alias pagga="toilet -t -f pagga"
alias paggaborder="toilet -t -f pagga -F border"

# ┐─┐┐ ┬┐─┐┌┐┐┬─┐┌┌┐
# └─┐└┌┘└─┐ │ ├─ │││
# ──┘ ┆ ──┘ ┆ ┴─┘┘ ┆

# systemctl query
alias sysstat='systemctl status'
alias systype='systemctl -t'
alias sysfailed='systemctl --state=failed'
alias syslsu='systemctl list-units'
alias syslsuf='systemctl list-unit-files'
alias syslssoc='systemctl list-sockets'
alias syslsser='systemctl list-services'
alias sysise='systemctl is-enabled'
alias sysisa='systemctl is-enabled'
alias sysisf='systemctl is-failed'
alias syscat='sudo systemctl cat'

# systemctl modify
alias sysresd='sudo systemctl daemon-reload'
alias sysenable='sudo systemctl enable'
alias sysstart='sudo systemctl start'
alias sysstop='sudo systemctl stop'
alias sysrest='sudo systemctl restart'
alias syscan='sudo systemctl cancel'
alias sysedit='sudo systemctl edit'
alias sysdis='sudo systemctl disable'

# ┐ ┬┌─┐┐─┐
# │┌┘│  └─┐
# └┘ └─┘──┘

alias diff='colordiff'

# --- git ---
alias gits='git status'
alias gitd='git diff'
alias gitdc='git diff --cached'
alias gitout='git checkout'
alias gitsubupd='git submodule foreach git pull origin master'

# --- svn ---
alias svn='colorsvn'
alias svns='svn status'

# get last commit diff
alias svnlastdiff='svn log -r COMMITTED --diff'

# get a given rev's commit diff
alias svnrevdiff='svn log --diff -r'
alias svnupd='svn update'

#show last 30 log entries in pager
alias svnls='svn log --limit 30|less'

# show last ten commited difs in pager
alias svnll='svn log --diff --limit 10|less'

# git formatted diff
alias svndl='svn diff --git'

# diff short
alias svnds='svn diff --summarize'

# dont display added files and modified whitespace
alias svnd='svn diff --no-diff-added -x -w'

# revert entire tree from here WARN: Dangerous
alias svnundo='svn revert --force-interactive --recursive .'

alias svnaddall="svn status | grep '?' | sed 's/^.* /svn add /' | bash"
alias svnrmall="svn status | grep '!' | sed 's/^.* /svn rm /' | bash"
#alias svnaddall="svn add `svn status . | awk '/^[?]/{print $2}'`"

# ┬─┐┬─┐┐ ┬┬─┐┬  ┌─┐┬─┐
# │ │├─ │┌┘├─ │  │ ││─┘
# ┆─┘┴─┘└┘ ┴─┘┆─┘┘─┘┆

alias lein='rlwrap lein'
alias figwheel='lein do clean, figwheel'
alias eastwood='lein eastwood "{:namespaces [:source-paths]}"'
# find -name '*.hx' -print -exec sed -i.bak 's/import flash/import openfl/g' {} \;


# ┌┌┐o┐─┐┌─┐
# ││││└─┐│
# ┘ ┆┆──┘└─┘

# delete and or refresh shell confs
alias xrmerge="xrdb -merge ~/.Xresources"
alias xrload="xrdb -load ~/.Xresources"
alias zrefresh="source $HOME/.zshrc"

alias _="sudo"

# quit aliases
alias :q="exit"
alias q:="exit"
alias :Q="exit"

# common typo
alias claer='clear'
alias cl='clear'

# quick alias to remove steam runtime and use native
# see: https://wiki.archlinux.org/index.php/Steam#Using_native_runtime
alias rmsteamlibs='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete'

