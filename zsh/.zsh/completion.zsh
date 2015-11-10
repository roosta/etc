# ┏━┓┏━┓┏┏┓┳━┓┳  ┳━┓┏┓┓o┏━┓┏┓┓
# ┃  ┃ ┃┃┃┃┃━┛┃  ┣━  ┃ ┃┃ ┃┃┃┃
# ┗━┛┛━┛┛ ┇┇  ┇━┛┻━┛ ┇ ┇┛━┛┇┗┛
# thanks to:
# * https://github.com/xero/dotfiles/blob/master/zsh/.zsh/autocompletion.zsh
# * https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/completion.zsh
# * http://dotshare.it/dots/100/

# init
autoload -Uz compinit
compinit
autoload -U ~/.zsh/completion/*(:t)

# do not autoselect the first completion entry
unsetopt menu_complete
unsetopt flowcontrol

setopt auto_menu # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

# general
zstyle ':completion:*' rehash true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''

# use dircolors for menus
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: hit TAB for more, or the character to insert%s

# If you end up using a directory as argument, this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long #200
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' separate-sections 'yes'
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' use-perl=1

# formatting
zstyle ':completion:*:descriptions' format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
zstyle ':completion:*:warnings'     format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'

## ignore completion to commands we don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

## zstyle kill menu
zstyle ':completion:*:*:kill:*'           menu yes select
zstyle ':completion:*:kill:*'             force-list always
zstyle ':completion:*:kill:*'             command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# completion cache
zstyle ':completion::complete:*'       use-cache 1
zstyle ':completion::complete:*'       cache-path $ZSH_CACHE_DIR


zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:functions' ignored-patterns '_*'

# mplayer
zstyle ':completion:*:*:mplayer:*' tag-order files
zstyle ':completion:*:*:mplayer:*' file-patterns   \
       '*.(rmvb|mkv|mpg|wmv|mpeg|avi|flv|mp3|mp4|flac|ogg):video' \
       '*:all-files' '*(-/):directories'

# vim
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' file-sort modification
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' tag-order files
zstyle ':completion:*:vim:*:directories' ignored-patterns \*
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*:*files' ignored-patterns \
       '*~|*.(old|bak|zwc|viminfo|rxvt-*|zcompdump)|pm_to_blib|cover_db|blib' file-sort modification

# change directory
#zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*' file-sort access
zstyle ':completion:*:*:(cd):*' menu select
zstyle ':completion:*:*:(cd):*' completer _history

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*:*:perl:*' file-patterns '*'

# MRU
zstyle ':completion:most-accessed-file:*' match-original both
zstyle ':completion:most-accessed-file:*' file-sort access
zstyle ':completion:most-accessed-file:*' file-patterns '*:all\ files'
zstyle ':completion:most-accessed-file:*' hidden all
zstyle ':completion:most-accessed-file:*' completer _files

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show
