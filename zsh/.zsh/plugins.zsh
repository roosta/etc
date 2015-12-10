# ┏━┓┓━┓┳ ┳ ┳━┓┳  ┳ ┓┏━┓o┏┓┓┓━┓
# ┏━┛┗━┓┃━┫o┃━┛┃  ┃ ┃┃ ┳┃┃┃┃┗━┓
# ┗━┛━━┛┇ ┻o┇  ┇━┛┇━┛┇━┛┇┇┗┛━━┛
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ┬  ┐─┐   ┌─┐┌─┐┬  ┌─┐┬─┐┐─┐
# │  └─┐   │  │ ││  │ ││┬┘└─┐
# ┆─┘──┘───└─┘┘─┘┆─┘┘─┘┆└┘──┘
# https://github.com/trapd00r/LS_COLORS
eval $(dircolors -b $HOME/.dircolors)

# ┌─┐┬ ┬┬─┐┌─┐┬┌   ┬─┐┌┐┐┬─┐  ┐─┐┌─┐┬ ┐┬─┐┌─┐┬─┐
# │  │─┤├─ │  ├┴┐  │─┤││││ │  └─┐│ ││ ││┬┘│  ├─
# └─┘┆ ┴┴─┘└─┘┆ ┘  ┘ ┆┆└┘┆─┘  ──┘┘─┘┆─┘┆└┘└─┘┴─┘
plugin_location=$HOME/.zsh/plugins
[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -f $plugin_location/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source $plugin_location/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f $plugin_location/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $plugin_location/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias d='fasd -d'        # directory
alias c='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias c='fasd_cd -d'     # cd, same functionality as j in autojump
alias zi='fasd_cd -d -i' # cd with interactive selection
alias ci='fasd_cd -d -i' # cd with interactive selection
#alias v='f -e vim'       # quick opening files with vim
alias v='f -t -e vim -b viminfo' # mimic 'v'

# add fasd completion shortcuts
bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (fils and directories)
bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

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

# ┬─┐┬ ┐┌─┐┌─┐┐ ┬  ┬─┐o┌┐┐┬─┐┬─┐┬─┐
# ├─ │ │┌─┘┌─┘└┌┘──├─ │││││ │├─ │┬┘
# ┆  ┆─┘└─┘└─┘ ┆   ┆  ┆┆└┘┆─┘┴─┘┆└┘

# plugin handled externally with vim-plug
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Respecting .gitignore, .hgignore, and svn:ignore
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# COMMAND HISTORY
# -------------------
# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# CHANGING DIRECTORY
# ---------------------

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}


# KILL
# -----------
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# OPENING FILES
# ---------------

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# GIT
# ---------

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fcoc - checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
    while out=$(
      git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
      fzf --ansi --no-sort --query="$q" --print-query \
          --expect=ctrl-d,ctrl-b);
    do
      q=$(head -1 <<< "$out")
      k=$(head -2 <<< "$out" | tail -1)
      sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
      [ -z "$sha" ] && continue
      if [ "$k" = 'ctrl-d' ]; then
        git diff $sha
      elif [ "$k" = 'ctrl-b' ]; then
        git stash branch "stash-$sha" $sha
        break;
      else
        git stash show -p $sha
      fi
    done
}

# TAGS
# ------------------
# ftags - search ctags
ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

