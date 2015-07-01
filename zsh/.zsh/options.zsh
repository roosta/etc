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
