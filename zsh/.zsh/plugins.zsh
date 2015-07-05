# fasd ( https://github.com/clvv/fasd )
eval "$(fasd --init auto)"

alias v='f -e vim' # quick opening files with vim
alias sv='sudo fasd -e vim' # quick svim access
# enable powerline
. /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh

# read dir colors
eval $( dircolors -b $HOME/.dircolors/LS_COLORS )

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# source the plugin https://github.com/zsh-users/zsh-syntax-highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# color overrides
# ZSH_HIGHLIGHT_STYLES[default]='none'
# ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
# ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
# ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[precommand]='none'
# ZSH_HIGHLIGHT_STYLES[commandseparator]='none'
# ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[path]='none'
# ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
# ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'
# ZSH_HIGHLIGHT_STYLES[globbing]='fg=green'
# ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'
# ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
# ZSH_HIGHLIGHT_STYLES[assign]='none'

# source and configure history search
source $HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# use vim for less
export PAGER=/usr/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

# Base16 Shell
BASE16_SHELL="$HOME/.zsh/plugins/base16-shell/base16-railscasts.darker.sh"
#BASE16_SHELL="$HOME/.zsh/plugins/base16-shell/base16-railscasts.dark.sh"
#BASE16_SHELL="$HOME/.zsh/plugins/base16-shell/base16-atelierlakeside.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
