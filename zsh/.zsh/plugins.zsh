# ┌───────────────────────────────────────────────────────────┐
# │░▀▀█░█▀▀░█░█░░░░░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░░░█▀▀░█▀█░█▀█░█▀▀░│
# │░▄▀░░▀▀█░█▀█░░▀░░█▀▀░█░░░█░█░█░█░░█░░█░█░░░█░░░█░█░█░█░█▀▀░│
# │░▀▀▀░▀▀▀░▀░▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░│
# └───────────────────────────────────────────────────────────┘

# fasd ( https://github.com/clvv/fasd )
eval "$(fasd --init auto)"

alias v='f -e vim' # quick opening files with vim
alias sv='sudo fasd -e vim' # quick svim access
# enable powerline
. /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh

# read dir colors
eval $( dircolors -b $HOME/.dircolors/LS_COLORS )

# Base16 Shell
#BASE16_SHELL="$HOME/.zsh/plugins/base16-shell/base16-railscasts.darker.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# source the plugin https://github.com/zsh-users/zsh-syntax-highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source and configure history search
source $HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

for plugin (~/.zsh/plugins/*.zsh) source $plugin
