# ┌───────────────────────────────────────────┐
# │▀▀▀░░░░░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀░░░░░▀▀▀│
# │▀▀▀▀░░░░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█░░░░▀▀▀▀│
# │█▀▀▀▀▀░░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░▀▀▀▀▀█│
# │█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█│
# │█░░  Author : Roosta <mail@roosta.sh>   ░░█│
# │█░░  Site   : http://dotfiles.roosta.sh ░░█│
# │█░░  Github : https://github.com/roosta ░░█│
# └───┬───────────────────────────────────────┘
#     │
# ┌───┘
# ┆

# ┐ ┬o┌┌┐
# │┌┘││││
# └┘ ┆┘ ┆

alias vi="vim"

# quick edits
alias vigit='vim ~/.gitconfig'
alias vissh='vim ~/.ssh/config'
alias vii3='vim ~/.i3/config.j2'
alias vialias='vim ~/.zsh/aliases.zsh'
alias vivi='vim ~/.vimrc'
alias vivim='vim ~/.vimrc'
alias vixr='vim ~/.Xresources'
alias vitmux='vim ~/.tmux.conf'
alias vixinit='vim ~/.xinitrc'
alias vifont='vim ~/.config/fontconfig/fonts.conf'
alias vibinds='vim ~/.xbindkeysrc'
alias vivimp='vim ~/.vimperatorrc'
alias vigtk='vim ~/.gtkrc-2.0 ~/.config/gtk-3.0/settings.ini'

#alias vitodo='vim ~/todo.md'
#alias todo='cat ~/todo.md'
#alias mdtodo='atom ~/todo.md'

# ┬─┐o┌┐┐┬─┐
# ├─ │││││ │
# ┆  ┆┆└┘┆─┘

alias grep="ag -i"

# locate an alias quickly
alias grea="cat ~/.zsh/aliases.zsh | grep"

# grep command history quickly
alias greh="cat ~/.histfile | grep"

alias greps="ps -aux|grep"

# echo path variable
alias lspath='echo -e ${PATH//:/\\n}'

# locate file at working dir
alias gref='lsp -p|grep'
alias grefr='ls -R|grep'

# list pulseaudio sinks
alias lssink="pacmd list-sinks|egrep -i 'index:|name:'"

# recursive grep through filetypes
alias grehx='grep -R --include="*.hx"'
alias greclj='grep -R --include="*.clj*"'

# yes
alias awk='gawk'

# ┐─┐┬─┐┬─┐┬─┐┌┐┐┐ ┬
# └─┐│─┤├─ ├─  │ └┌┘
# ──┘┘ ┆┆  ┴─┘ ┆  ┆

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

# ┌┌┐┌─┐┐ ┬┬─┐┌┌┐┬─┐┌┐┐┌┐┐
# ││││ ││┌┘├─ │││├─ │││ │
# ┘ ┆┘─┘└┘ ┴─┘┘ ┆┴─┘┆└┘ ┆

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
alias ls="ls -lAhpk --color=auto --group-directories-first"
#alias dir='ls++ --potsf -lAhpXk'
alias dir='ls++ -lAhpk'
alias dirr='dir -R'
alias lsa='lsp -p'

# fasd plugin aliases (most of these are added by default but I often grep this list)
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias c='fasd_cd -d'     # cd, same functionality as j in autojump
alias zi='fasd_cd -d -i' # cd with interactive selection
alias ci='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim'       # quick opening files with vim
#alias v='f -t -e vim -b viminfo'

# ┐─┐┬─┐┌─┐┬ ┐┬─┐o┌┐┐┐ ┬
# └─┐├─ │  │ ││┬┘│ │ └┌┘
# ──┘┴─┘└─┘┆─┘┆└┘┆ ┆  ┆

alias checkrootkits="sudo rkhunter --update && sudo rkhunter --propupd && sudo rkhunter --check --sk"
alias scanhome="sudo freshclam && clamscan --recursive=yes --infected -l $HOME/.tmp/clamscan.log $HOME"
alias scanroot="sudo freshclam && sudo clamscan --recursive=yes --infected /"
alias scanhere="sudo freshclam && sudo clamscan --recursive=yes --infected ."

# ┬─┐┬─┐┌─┐┌┌┐┬─┐┌┐┐
# │─┘│─┤│  ││││─┤│││
# ┆  ┘ ┆└─┘┘ ┆┘ ┆┆└┘

# source: https://wiki.archlinux.org/index.php/Pacman_tips
alias pacman='pacman --color=auto' # use pacaur as a pacman extension

# Installing
alias pacs='sudo pacman -S' # Install specific package(s) from the repositories
alias pacsi='pacman -Si' # Display information about a given package in the repositories
alias pacss='pacman -Ss' # Search for package(s) in the repositories
alias pacdl='pacman -Sw' # Download specified package(s) as .tar.xz ball


alias pacrm='sudo pacman -R' # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrmf='sudo pacman -Rns' # Remove the specified package(s), its configuration(s) and unneeded dependencies

# orphans
alias paco='aura -O' # with no args: display orphans. With arg adopt package.
alias pacorm="sudo aura -Oj" # remove all orphan packages.
#alias pacorm='sudo pacman -Rns $(pacman -Qtdq)' # remove all orphaned packages
#alias paco="pacman -Qdt" # List all packages which are orphaned


# management
alias pacclean="sudo pacman -Scc" # Clean cache - delete all the package files in the cache
alias pacqs='pacman -Qs' # Search for package(s) in the local database
alias pacqi='pacman -Qi' # Display information about a given package in the local database
alias pacu='pacman -U' # Install specific package not from the repositories but from a file
alias pacls="pacman -Ql" # List all files installed by a given package
alias pacown="pacman -Qo" # Show package(s) owning the specified file(s)
alias pacexp='pacman -Qet' # list all packages explicitly installed and not required as dependencies
alias pacexpl="pacman -D --asexp" # Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep" # Mark one or more installed packages as non explicitly installed
alias pacupre='pacman -Sy && sudo abs' # Update and refresh the local package and ABS databases against repositories
alias pacinsd='pacman -S --asdeps' # Install given package(s) as dependencies

# Updating
alias pacupd='sudo pacman -Syu' # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacupdf='sudo pacman -Syyu' # force a refresh of all package lists and upgrade.
alias getmirror='sudo curl -o /etc/pacman.d/mirrorlist https://www.archlinux.org/mirrorlist/all/' # get country sorted mirrorlist to use with reflector
alias pacmirupd='sudo reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syy' # use reflector to sort the 5 fastest mirrors and force update
alias pacmir='sudo pacman -Syy' # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# AUR
# ------

# installing
alias paca="sudo aura -A" # install AUR package
alias pacas="aura -As" # search AUR
alias pacaf="sudo aura -Ax" # install and display make output
alias pacaa="aura -Aa" # remove make deps when finished installing
alias pacadiff="aura -Ak" # show PKGBUILD diff
alias pacaupdf="aura -Akua" # upgrades, removes make deps, shows PKGBUILD diffs
alias pacai="aura -Ai" # get AUR package information
alias pacaupd="sudo aura -Au" # update AUR packages
alias pacapkg="aura -Ap" # Display an AUR package"s PKGBUILD
alias pacadeps="aura -Ad" # display package deps
alias pacaexp='pacman -Qem' # list explicit packages not from official repos

# logs
alias pacalog='aura -Li' # list install/upgrade history for a package
alias pacalogx='aura -Ls' # Search the pacman logfile via a regex

#Downgrade a package (this is interactive):
#aura -C (package)

#Search the package cache for package files via a regex:
#aura -Cs (regex)

#Backup the package cache:
#aura -Cb (/path/to/backup/location/)

#Reduce the package cache to contain only 'x' of each package file:
#aura -Cc x


#Build a repository package manually:
#aura -M (package)

#Build a repository package and all its dependencies manually:
#aura -M (package) --absdeps

#Sync a single package's data to the local ABS Tree:
#aura -Mt (package)

#Sync all package data in the local ABS Tree:
#aura -My

#Remove only those package files from the cache that aren't present in any package record:
#aura -Ccc


# ┬ ┐┌┐┐o┬  ┐─┐
# │ │ │ ││  └─┐
# ┆─┘ ┆ ┆┆─┘──┘

alias watchff='watch progress -wc firefox' # watch firefox download progress.
alias tarx="tar --one-top-level -zxvf" # extract tar to directory same as filename
alias ports='netstat -tulanp' # list open ports
alias pip='sudo -H pip' # set home variable when running pip
alias tmux='tmux -2'
alias ufw='sudo ufw'
alias make='colormake'

# stow is always verbose
alias stow='stow -v'

# keep forgetting what these are called.
alias getclass='xprop'
alias getkey='xev -event keyboard'
#alias getkeycode=xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
alias logcolor='ccze'

# utput from a command with xclip when this is piped in
alias copy='xsel -i -p -b'

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
alias xfontsel='xfontsel -print|copy'

alias ~~="$HOME/.backup/home/$USER"
alias tasks="task"

# ┐─┐┐ ┬┐─┐┌┐┐┬─┐┌┌┐
# └─┐└┌┘└─┐ │ ├─ │││
# ──┘ ┆ ──┘ ┆ ┴─┘┘ ┆

# systemctl query
alias sysstat='systemctl status'
alias systype='systemctl --type='
alias sysstate='systemctl --state='
alias syslsu='systemctl list-units'
alias syslsuf='systemctl list-unit-files'
alias syslssoc='systemctl list-sockets'
alias syslsser='systemctl list-services'
alias sysise='systemctl is-enabled'
alias sysisa='systemctl is-enabled'
alias sysisf='systemctl is-failed'
alias syscat='sudo systemctl cat'

# systemctl modify
alias sysresf='sudo systemctl daemon-reload'
alias sysenable='sudo systemctl enable'
alias sysstart='sudo systemctl start'
alias sysstop='sudo systemctl stop'
alias sysrest='sudo systemctl restart'
alias syscan='sudo systemctl cancel'
alias sysedit='sudo systemctl edit'

# ┐ ┬┌─┐┐─┐
# │┌┘│  └─┐
# └┘ └─┘──┘

alias diff='colordiff'

# --- git ---
alias gits='git status'
alias gitd='git diff'
alias gitout='git checkout'

# show short log
alias gitls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
# show long log
alias gitll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'

alias gita='git add'
alias gitaa='git add -A'
alias gitc='git commit'
alias commit='git commit'
alias gitca='git commit -a'
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

alias figwheel='rlwrap lein figwheel'
alias hxrepl='haxelib run ihx'

alias tlwd='cd /home/transform/Projects/Transform/Daniel'
alias tlproj='cd /home/transform/Projects'

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

