# ┌───────────────────────────────────────────────┐
# │░█▀▀░█░█░█▀█░▀█▀░█▀█░█░█░░░█▀▀░█░█░▀█▀░█▀▄░█▀█░│
# │░▀▀█░░█░░█░█░░█░░█▀█░▄▀▄░░░█▀▀░▄▀▄░░█░░█▀▄░█▀█░│
# │░▀▀▀░░▀░░▀░▀░░▀░░▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░░▀░▀░▀░▀░│
# └───────────────────────────────────────────────┘
# add some extra syntax highlighting
# source: http://dotshare.it/dots/100/
#         https://github.com/xero/dotfiles/blob/master/zsh/.zsh/syntax.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# STYLES
# Aliases and functions
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue,bold'

# Commands and builtins
ZSH_HIGHLIGHT_STYLES[command]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=cyan,bold"

# Paths
ZSH_HIGHLIGHT_STYLES[path]='fg=white'

# Globbing
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow,bold'

# Options and arguments
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'

ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=green"

ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[commandseparator]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[assign]='none'

# PATTERNS
# mark dangerous commands with red
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=black,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('rmrf *' 'fg=black,bold,bg=red')

# Sudo
ZSH_HIGHLIGHT_PATTERNS+=('sudo ' 'fg=black,bold,bg=red')

# colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
    USER_LEVEL="%F{cyan}"
else # root!
    USER_LEVEL="%F{red}"
fi

# colored man pages
# source: https://github.com/imkira/dotfiles/blob/master/.zsh/colored-man-pages.zsh
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;33;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'
