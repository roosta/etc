# ┌──────────────────────────────────────────┐
# │░▀▀█░█▀▀░█░█░░░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀│
# │░▄▀░░▀▀█░█▀█░░░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█│
# │░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀│
# └──────────────────────────────────────────┘

setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
# setopt NO_BG_NICE # don't nice background tasks
# setopt NO_HUP
# setopt NO_LIST_BEEP
# setopt LOCAL_OPTIONS # allow functions to have local options
# setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
# setopt SHARE_HISTORY # share history between sessions ???
# setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

unsetopt beep

# rehash automatically
zstyle ':completion:*' rehash true

# ======= History =======
# -----------------------

# setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
# setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

HISTFILE=~/.histfile
HISTSIZE=1200
SAVEHIST=1000

#  enable a built in help command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
#unalias run-help
alias help=run-help
