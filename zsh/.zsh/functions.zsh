# ┌──────────────────────────────────────────┐
# │░░░█▀▀░█░█░█▀█░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀░░░░│
# │░░░█▀▀░█░█░█░█░█░░░░█░░░█░░█░█░█░█░▀▀█░░░░│
# │░░░▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░░│
# └──────────────────────────────────────────┘

# allow functions in the prompt
setopt PROMPT_SUBST

# autoload zsh functions
 fpath=(~/.zsh/functions $fpath)
 autoload -U ~/.zsh/functions/*(:t)

# enable auto-execution of functions
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# prepend git functions needed for prompt
 preexec_functions+='preexec_update_git_vars'
 precmd_functions+='precmd_update_git_vars'
 chpwd_functions+='chpwd_update_git_vars'

 # functions.zsh: Custom functions, and function invocations.
# P.C. Shyamshankar <sykora@lucentbeing.com>
if (( C == 256 )); then
    autoload spectrum && spectrum # Set up 256 color support.
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
