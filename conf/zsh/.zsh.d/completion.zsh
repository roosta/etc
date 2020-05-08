# ┏━┓┓━┓┳ ┳  ┏━┓┏━┓┏┏┓┳━┓┳  ┳━┓┏┓┓o┏━┓┏┓┓
# ┏━┛┗━┓┃━┫  ┃  ┃ ┃┃┃┃┃━┛┃  ┣━  ┃ ┃┃ ┃┃┃┃
# ┗━┛━━┛┇ ┻  ┗━┛┛━┛┛ ┇┇  ┇━┛┻━┛ ┇ ┇┛━┛┇┗┛

fpath=($HOME/.zsh.d/completion $fpath)
# fpath=($HOME/.zsh.d/plugins/zsh-completions/src $fpath)
autoload -Uz compinit
compinit -u
# autoload -U ~/.zsh.d/completion/*(:t)
