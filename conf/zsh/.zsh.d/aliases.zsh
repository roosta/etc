# ┌───────────────────────────────────────────┐
# │▀▀▀▀▀▀░░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀░░▀▀▀▀▀▀│
# │▀▀▀▀▀▀░░█▀█░█░░░ █ ░█▀█░▀▀█░█▀▀░▀▀█░░▀▀▀▀▀▀│
# │█▀▀▀▀▀░░▀ ▀░▀▀▀░▀▀▀░▀ ▀░▀▀▀░▀▀▀░▀▀▀░░▀▀▀▀▀█│
# │█     ░░ ░ ░   ░   ░ ░ ░   ░   ░   ░░     █│
# │█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█│
# │█░░  Author : Roosta <mail@roosta.sh>   ░░█│
# │█░░  Site   : https://www.roosta.sh     ░░█│
# │█░░  Github : https://github.com/roosta ░░█│
# └───────────────────────────────────────────┘
# System: {{{1

# Set up nohup so that it can deal with an argument that is itself an alias name:
alias nohup="nohup "
alias su="su -"

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

#}}}
# Quick edits: {{{1

alias vi="vim"
# alias vim="ect"
alias vigit="${EDITOR:-vim} ~/.gitconfig"
alias vissh="${EDITOR:-vim} ~/.ssh/config"
alias vialias="${EDITOR:-vim} ~/.zsh.d/aliases.zsh"
alias vivim="vim ~/.vimrc"
alias vixres="${EDITOR:-vim} ~/.Xresources"
alias vitmux="vim ~/.tmux.conf"
alias vixinit="${EDITOR:-vim} ~/.xinitrc"
alias vixinit.local="${EDITOR:-vim} ~/.xinitrc.local"
alias vifont="${EDITOR:-vim} ~/.config/fontconfig/fonts.conf"
alias vibinds="${EDITOR:-vim} ~/.xbindkeysrc"
alias vivimp="${EDITOR:-vim} ~/.vimperatorrc"
alias vigtk="${EDITOR:-vim} ~/.gtkrc-2.0 ~/.config/gtk-3.0/settings.ini"
alias vilein="${EDITOR:-vim} ~/.lein/profiles.clj"
alias viterm="${EDITOR:-vim} ~/.Xresources.d/urxvt.xresources"
alias vii3="${EDITOR:-vim} ~/etc/templates/i3/config.i3"
alias vii3vars="${EDITOR:-vim} ~/etc/templates/i3/variables.i3"
alias vienv="${EDITOR:-vim} ~/.zprofile"
alias vizopts="${EDITOR:-vim} ~/.zsh.d/options.zsh"
alias vizsh="${EDITOR:-vim} ~/.zshrc"
alias vixfont="${EDITOR:-vim} ~/.Xresources.d/fonts"
alias viemacs="emacsclient -t ~/.spacemacs.d"
alias vitodo="emacsclient -t ~/org/TODOs.org"
alias vihours="emacsclient -t ~/src/hours/hours.org"
alias vimutt="${EDITOR:-vim} ~/.muttrc"
alias vipoly="${EDITOR:-vim} ~/.config/polybar/config"
alias vihosts="${EDITOR:-vim} /etc/hosts"
alias vimime="${EDITOR:-vim} ~/.config/mimeapps.list"
alias virofi="${EDITOR:-vim} ~/etc/templates/rofi/config.rofi"
alias vijoker="${EDITOR:-vim} ~/.joker"
alias vidunst="${EDITOR:-vim} ~/etc/templates/dunst/dunstrc"
alias pacorg="${EDITOR:-vim} ~/org/pacman.org"
alias vifzf="${EDITOR:-vim} ~/.zsh.d/plugin_conf/fzf.zsh"

alias vidir="env EDITOR=vim vidir"

#}}}
# Find: {{{1

alias ag="ag -i --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36' --hidden -p ~/.agignore"

alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias aliasg="vimcat ~/.zsh.d/aliases.zsh | ag" # locate an alias quickly
alias aliasgrep="aliasg"
alias histgrep="cat ~/.histfile | ag" # grep command history quickly
alias lspath='echo -e ${PATH//:/\\n}' # echo path variable

alias psgrep='ps aux|head -n 1 && ps aux|ag'

# locate file at working dir
if hash ag 2>/dev/null; then
  alias lsg='\ls -lAh | ag'
else
  alias lsg='\ls -lAh | grep'
fi
#alias lsrgrep='lsa -R | grep'
alias lsrg='tree -f -i -h --matchdirs -P'

# list pulseaudio sinks
alias sinks="pacmd list-sinks|egrep -i 'index:|name:'"

alias awk='gawk'
alias find-here='find . -name'
#}}}
# Web search: {{{1

# see ~/.zsh/web_search.zsh
alias google='web_search google'
alias ddg='web_search duckduckgo'
alias duck='web_search duckduckgo'
alias github='web_search github'
alias devdocs='web_search devdocs'
alias docs='devdocs'

# leverage duckduckgo's bang functionaliy.
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias yt='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias img='web_search duckduckgo \!i'
alias bang='web_search duckduckgo \!'
alias arch='web_search duckduckgo \!aw'
alias aw='web_search duckduckgo \!aw'
alias aur='web_search duckduckgo \!aur'
alias apkg='web_search duckduckgo \!apkg'
alias clojars='web_search duckduckgo \!clojars'
alias npm-search='web_search duckduckgo \!npm'

#}}}
# Global: {{{1

alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
# alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | less"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NUL="> /dev/null 2>&1"
alias -g PIPE='|'
alias -g R=' > /c/aaa/tee.txt '
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

#alias -g ...='../..'
#alias -g ....='../../..'
#alias -g .....='../../../..'
#alias -g ......='../../../../..'

#}}}
# Suffix: {{{1

# example: type 'test.clj' opens vim with test.clj as active buffer.

alias -s yml=vim
alias -s cljs=emacsclient
alias -s clj=emacsclient
alias -s txt=vim
alias -s tex=vim
alias -s html=vim
alias -s js=vim
alias -s md=emacsclient
alias -s org=emacsclient
alias -s net=firefox
alias -s net=firefox
alias -s com=firefox

#}}}
# Defaults: {{{1
# Aliases that shadow its original command. Like docker='sudo docker'

alias mv=' timeout 8 mv -iv'
alias rm=' timeout 3 rm -Iv --one-file-system'
alias cp='cp -i'
alias cpr='cp -r'
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
alias docker='sudo docker'


#}}}
# Movement: {{{1

alias cd..='cd ..'

# dirstack movement: needs some extra config, see dirstack.sh
alias dirs='dirs -v'
# alias 1='cd -'
# alias 2='cd -2'
# alias 3='cd -3'
# alias 4='cd -4'
# alias 5='cd -5'
# alias 6='cd -6'
# alias 7='cd -7'
# alias 8='cd -8'
# alias 9='cd -9'
# alias 10='cd -10'
# alias 11='cd -11'
# alias 12='cd -12'
# alias 13='cd -13'
# alias 14='cd -14'
# alias 15='cd -15'
# alias 16='cd -16'
# alias 17='cd -17'
# alias 18='cd -18'
# alias 19='cd -19'
#}}}
# Lists: {{{1

if [[ $TERM == 'eterm-color' ]]; then
  alias ls='\ls -lAh'
else
  if hash exa 2>/dev/null; then
    alias ls='exa -aghl --git --group-directories-first -F'
  elif hash ls++ 2>/dev/null; then
    alias ls='ls++ -lAhpk --potsf'
  else
    alias ls="ls -lsAhpk --color=auto --group-directories-first"
  fi
fi
alias lsr='tree'
alias lsp='lsp -p'
#}}}
# Security: {{{1

alias checkrootkits="sudo rkhunter --update && sudo rkhunter --check --sk && sudo rkhunter --propupd"
alias scanhome="sudo freshclam && clamscan --recursive=yes --infected -l $HOME/var/log/clamscan.log $HOME"
alias scanroot="sudo freshclam && sudo clamscan --recursive=yes --infected -l $HOME/var/log/clamscan.log /"
alias scanhere="sudo freshclam && sudo clamscan --recursive=yes --infected -l $HOME/var/log/clamscan.log ."
#}}}
# Utils: {{{1

alias tree="tree -ah"
alias watchfirefox="watch progress -wc firefox" # watch firefox download progress.
alias tarx="tar --one-top-level -zxvf" # extract tar to directory same as filename
alias ports="netstat -tulanp" # list open ports
#alias pip="sudo -H pip" # set home variable when running pip
alias tmux="tmux -2" # force 256 color mode in tmux
alias tn="tmux new-session -s" # start new session by giving a name
alias trw="tmux rename-window"
alias ta="tmux attach -t"
alias tkill="tmux kill-pane -t"
alias tls="tmux ls"
alias tc="tmux choose-session"
alias tk="tmux kill-session -t"
alias tw="tmux new-window -n"  # open new window with name
alias ufw="sudo ufw"
# alias make="colormake"
alias pdf="zathura"

alias free='free -h'

if hash dfc 2>/dev/null; then
  alias disks='dfc'
else
  # https://github.com/xero/dotfiles/blob/master/zsh/.zsh/aliases.zsh
  alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
fi

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
alias paste="clippaste" # see functions

# print date in various formats
alias gettime='date +"%T"'
alias now='date +"%Y-%m-%d@%T"'
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

alias pgrep='pgrep -ia'
alias grep='grep -i'
alias fehp='feh -g 640x480 -d -S filename'

alias mounttmpfs='sudo mount -t tmpfs tmpfs /mnt -o size=1024m'
alias killemacs='emacsclient -e "(save-buffers-kill-emacs)"'
alias gpg-reload='gpg-connect-agent reloadagent /bye'
alias tldr='tldr -t base16 --linux'
alias repl='rlwrap lumo'
alias user-mount="sudo mount -o gid=users,fmask=113,dmask=002"
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias music='ncmpcpp'
alias m='ncmpcpp'
alias update-font-cache='fc-cache -fv'
alias fm='vifm'
alias ssh='env TERM=xterm-256color ssh'

# NPM
alias npmls='npm -g ls --depth=0'
alias npmoutdated='npm outdated -g --depth=0'
#}}}
# VCS: {{{1
# --------

if hash hub 2>/dev/null; then
  alias git='hub'
fi

alias diff='colordiff'

# --- git ---
# use .gitconfig

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

alias sa="ssh-add ~/.ssh/id_rsa"
#}}}
# Develop {{{1

alias lein='rlwrap lein'
alias leindeps='lein deps :tree'
#alias figwheel='lein do clean, figwheel'
alias eastwood='lein eastwood "{:namespaces [:source-paths]}"'
# find -name '*.hx' -print -exec sed -i.bak 's/import flash/import openfl/g' {} \;
alias dust='rlwrap dust'
alias catz='pygmentize -g -O style=colorful'
alias cats='vimcat'
# alias cat=vimcat
#alias ccat='pygmentize -g -O style=colorful,linenos=1'
alias ccat='highlight -O ansi'
alias cljgrep='ag -R --include="*.clj*"'
alias ec='emacsclient -nw -c'
alias et='emacsclient -nw'
alias ancient-check-all='lein ancient check :all :allow-all :check-clojure'
alias ancient-check='lein ancient check :all :check-clojure'
alias ancient-upgrade-all='lein ancient upgrade :all :allow-all :check-clojure :no-tests'
alias ancient-upgrade='lein ancient upgrade :all :check-clojure :no-tests'
alias ancient-check-profile='lein ancient check-profiles :allow-all'
alias ancient-upgrade-profile='lein ancient upgrade-profiles :allow-all'
#}}}
# Misc {{{1

# delete and or refresh shell confs
alias xrmerge="xrdb -merge ~/.Xresources"
alias xrload="xrdb -load ~/.Xresources"
alias zref="source $HOME/.zshrc"

alias _="sudo"

#alias startwin="sudo systemctl restart libvirtd.service && sudo virsh start win8"

# quit aliases
alias :q="exit"
alias q:="exit"
alias :Q="exit"

# common typo
alias claer='clear'
alias cl='clear'
#alias virsh='sudo virsh'

# quick alias to remove steam runtime and use native
# see: https://wiki.archlinux.org/index.php/Steam#Using_native_runtime
alias rmsteamlibs='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete'

# cleanly shut down firefox
alias ffs="wmctrl -c firefox"
alias uh="ls && sleep 0.2 && clear"

# run setxkbmap again, sometimes toggling between layouts stops working
alias refresh-keyboard='setxkbmap -model pc104 -layout us,no -option grp:caps_toggle -option terminate:ctrl_alt_bksp'
#}}}
# Default opts: {{{1

alias jobs='jobs -l'

#}}}
# Pacman: {{{1

# show which package owns a given file
alias pacown='pacman -Qo'

# clean orphans
alias pacco='yay -Rns $(pacman -Qtdq)'

# clean cache
alias pacc='yay -Scc'

#}}}
# vim: fdm=marker:sw=2
