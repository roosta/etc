# ┌──────────────────────────────────┐
# │░░░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀░░░░│
# │░░░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█░░░░│
# │░░░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░░│
# └──────────────────────────────────┘

setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
unsetopt beep
#
# Alias every command that doesn't exist.
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
   source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# History
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

HISTFILE=~/.histfile
HISTSIZE=12000
SAVEHIST=10000

#  enable a built in help command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
#unalias run-help
alias help=run-help

# remove empty whitespace on righthand side of prompt
#ZLE_RPROMPT_INDENT=0

# Set up 256 color support.
# P.C. Shyamshankar <sykora@lucentbeing.com>
if (( C == 256 )); then
    autoload spectrum && spectrum
fi

# Autoload some useful utilities.
autoload -Uz zmv
autoload -Uz zargs
autoload -Uz vcs_info

# set title
case $TERM in
  *xterm*|*rxvt*|*screen*)
    # Special function precmd, executed before displaying each prompt.
    function precmd() {
    # Set the terminal title to the current working directory.
    print -Pn "\e]0;%n@%m:%~\a"
    # Get the current git branch into the prompt.
    vcs_info
  }
  # Special function preexec, executed before running each command.
  function preexec () {
  # Set the terminal title to the curently running command.
  print -Pn "\e]2;[${2:q}]\a"
}
esac

