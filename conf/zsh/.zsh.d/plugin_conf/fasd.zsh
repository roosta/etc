# ┬─┐┬─┐┐─┐┬─┐
# ├─ │─┤└─┐│ │
# ┆  ┘ ┆──┘┆─┘

# https://github.com/clvv/fasd
# Installed via AUR
eval "$(fasd --init auto)"
#
# fasd plugin aliases
#alias a='fasd -a'        # any
#alias s='fasd -si'       # show / search / select
#alias d='fasd -d'        # directory
#alias c='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
#alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
#alias zi='fasd_cd -d -i' # cd with interactive selection
#alias ci='fasd_cd -d -i' # cd with interactive selection
#alias v='f -e vim'       # quick opening files with vim
#alias v='f -t -e vim -b viminfo' # mimic 'v'

unalias s
unalias d

# add fasd completion shortcuts
# bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (fils and directories)
# bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
# bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

# all fasd args, passed after --init
#zsh-hook             # define _fasd_preexec and add it to zsh preexec array
#zsh-ccomp            # zsh command mode completion definitions
#zsh-ccomp-install    # setup command mode completion for zsh
#zsh-wcomp            # zsh word mode completion definitions
#zsh-wcomp-install    # setup word mode completion for zsh
#bash-hook            # add hook code to bash $PROMPT_COMMAND
#bash-ccomp           # bash command mode completion definitions
#bash-ccomp-install   # setup command mode completion for bash
#posix-alias          # define aliases that applies to all posix shells
#posix-hook           # setup $PS1 hook for shells that's posix compatible
#tcsh-alias           # define aliases for tcsh
#tcsh-hook            # setup tcsh precmd alias

