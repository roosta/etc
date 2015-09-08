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
alias vivim='vim ~/.vimrc'
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

# ======= Quick list/find  =======
# --------------------------------

# locate an alias quickly
alias gralias="alias | grep"

# grep command history quickly
alias grhist="cat ~/.histfile | grep"

# echo path variable
alias lspath='echo -e ${PATH//:/\\n}'

# locate file at working dir
alias grfile='lsa|grep'

# list pulseaudio sinks
alias lssink="pacmd list-sinks|egrep -i 'index:|name:'"

alias hxgrep='grep -r --include="*.hx"'

# ======= safety =======
# ----------------------
alias mv=' timeout 8 mv -iv'
alias rm=' timeout 3 rm -Iv --one-file-system'
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
# ----------------------

# use pacaur as a pacman extension
alias pacman='pacaur'

# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacupd='pacman -Syu'

# Download specified package(s) as .tar.xz ball
alias pacdl='pacman -Sw'

# Install specific package(s) from the repositories
alias pacs='pacman -S'

# Install specific package not from the repositories but from a file
alias pacu='pacman -U'

# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrm='pacman -R'

# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrmf='pacman -Rns'

# Display information about a given package in the repositories
alias pacsi='pacman -Si'

# Search for package(s) in the repositories
alias pacss='pacman -Ss'

# Display information about a given package in the local database
alias pacqi='pacman -Qi'

# Search for package(s) in the local database
alias pacqs='pacman -Qs'

# List all packages which are orphaned
alias pacorph="pacman -Qdt"

# Clean cache - delete all the package files in the cache
alias pacclean="pacman -Scc"

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
#alias pacupre='pacman -Sy && sudo abs'

# Install given package(s) as dependencies
#alias pacinsd='pacman -S --asdeps'

# Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacmir='pacman -Syy'

# AUR
# ------

#alias pacaur4='pacaur --domain aur4.archlinux.org'
#alias yaourt='pacaur'

# ======= Utils =======
# ---------------------

# ignore case in grep and color output
alias grep="grep -i --color=auto"

# extract tar to directory same as filename
alias tarx="tar --one-top-level -zxvf"

# list open ports
alias ports='netstat -tulanp'

# set home variable when running pip
alias pip='sudo -H pip'

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

# ======= VCS =======
# -------------------

# --- git ---
alias gs='git status'
alias gd='git diff'
alias gc='git checkout'
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gaa='git add -A'
alias commit='git commit'
alias gca='git commit -a'

# --- svn ---
alias sst='svn status'

# get last commit diff
alias slastdiff='svn log -r COMMITTED --diff'

# get a given rev's commit diff
alias srevdiff='svn log --diff -r'
alias sup='svn update'

alias slogs='svn log --limit 30|less'
alias slogl='svn log --diff --limit 30|less'

alias sldiff='svn diff|colordiff'

# ======= MISC =======
# --------------------

# merge new xresources config
alias xrmerge="xrdb -merge ~/.Xresources"
alias xrload="xrdb -load ~/.Xresources"

# re-source zsh config files
alias zrefresh="source $HOME/.zshrc"

alias _="sudo"

# quit aliases
alias :q="exit"
alias :Q="exit"

# common typo
alias claer='clear'

alias rmsteamlibs='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete'

alias repl='haxelib run ihx'
