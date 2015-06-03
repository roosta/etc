# setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
# setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

HISTFILE=~/.histfile
HISTSIZE=1200
SAVEHIST=1000
