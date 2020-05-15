# ┏━┓┓━┓┳ ┳  ┏━┓┏━┓┏┏┓┳━┓┳  ┳━┓┏┓┓o┏━┓┏┓┓
# ┏━┛┗━┓┃━┫  ┃  ┃ ┃┃┃┃┃━┛┃  ┣━  ┃ ┃┃ ┃┃┃┃
# ┗━┛━━┛┇ ┻  ┗━┛┛━┛┛ ┇┇  ┇━┛┻━┛ ┇ ┇┛━┛┇┗┛

fpath=($HOME/.zsh.d/completion $fpath)
# fpath=($HOME/.zsh.d/plugins/zsh-completions/src $fpath)
autoload -Uz compinit
compinit -u
# autoload -U ~/.zsh.d/completion/*(:t)

# OPTIONS
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${HOME}/.zcompcache"


# Case-insensitive (all), partial-word, and then substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
unsetopt CASE_GLOB

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
