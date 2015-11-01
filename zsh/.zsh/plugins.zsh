# ┌───────────────────────────────────────────────────────────┐
# │░▀▀█░█▀▀░█░█░░░░░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░░░█▀▀░█▀█░█▀█░█▀▀░│
# │░▄▀░░▀▀█░█▀█░░▀░░█▀▀░█░░░█░█░█░█░░█░░█░█░░░█░░░█░█░█░█░█▀▀░│
# │░▀▀▀░▀▀▀░▀░▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░│
# └───────────────────────────────────────────────────────────┘

# fasd ( https://github.com/clvv/fasd )
eval "$(fasd --init auto)"

# read dir colors
eval $( dircolors -b $HOME/.dircolors/LS_COLORS )

# source the plugin https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source and configure history search
source $HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# source fuzzy file finder plugin. Installed and managed by vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source the rest
for plugin (~/.zsh/plugins/*.zsh) source $plugin
