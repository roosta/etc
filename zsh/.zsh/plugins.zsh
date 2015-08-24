# ┌───────────────────────────────────────────────────────────┐
# │░▀▀█░█▀▀░█░█░░░░░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░░░█▀▀░█▀█░█▀█░█▀▀░│
# │░▄▀░░▀▀█░█▀█░░▀░░█▀▀░█░░░█░█░█░█░░█░░█░█░░░█░░░█░█░█░█░█▀▀░│
# │░▀▀▀░▀▀▀░▀░▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░│
# └───────────────────────────────────────────────────────────┘

# fasd ( https://github.com/clvv/fasd )
eval "$(fasd --init auto)"

alias v='f -e vim' # quick opening files with vim
alias sv='sudo fasd -e vim' # quick svim access

# read dir colors
eval $( dircolors -b $HOME/.dircolors/LS_COLORS )

# source the plugin https://github.com/zsh-users/zsh-syntax-highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source and configure history search
source $HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

for plugin (~/.zsh/plugins/*.zsh) source $plugin
