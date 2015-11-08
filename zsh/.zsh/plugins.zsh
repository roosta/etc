# ┌───────────────────────────────────────────────────────────┐
# │░▀▀█░█▀▀░█░█░░░░░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░░░█▀▀░█▀█░█▀█░█▀▀░│
# │░▄▀░░▀▀█░█▀█░░▀░░█▀▀░█░░░█░█░█░█░░█░░█░█░░░█░░░█░█░█░█░█▀▀░│
# │░▀▀▀░▀▀▀░▀░▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░│
# └───────────────────────────────────────────────────────────┘

# fasd ( https://github.com/clvv/fasd )
eval "$(fasd --init auto)"

# check for dircolors link and existance and eval
[ -h ~/.dircolors ] && eval $( dircolors -b $HOME/.dircolors )

# syntax hilighting with support for dircolors
# source https://github.com/trapd00r/zsh-syntax-highlighting-filetypes
[ -f ~/.zsh/plugins/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh ] && \
  source ~/.zsh/plugins/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh

# source and configure history search
[ -f ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] && \
  source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# source fuzzy file finder plugin. Installed and managed by vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source terminal web search plugin
[ -f ~/.zsh/plugins/web-search.zsh ] && source ~/.zsh/plugins/web-search.zsh
