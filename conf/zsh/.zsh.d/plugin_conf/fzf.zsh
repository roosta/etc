# ┬─┐┬ ┐┌─┐┌─┐┐ ┬  ┬─┐o┌┐┐┬─┐┬─┐┬─┐
# ├─ │ │┌─┘┌─┘└┌┘──├─ │││││ │├─ │┬┘
# ┆  ┆─┘└─┘└─┘ ┆   ┆  ┆┆└┘┆─┘┴─┘┆└┘

# plugin handled externally with vim-plug
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export FZF_DEFAULT_OPTS='--no-256'

#alias fzf='TERM=screen-256color fzf'
#alias fzf-tmux='TERM=screen-256color fzf'

# Respecting .gitignore, .hgignore, and svn:ignore
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# COMMAND HISTORY
# -------------------

# fh - repeat history
fhist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf-tmux +s --tac | sed 's/ *[0-9]* *//')
}

# CHANGING DIRECTORY
# ---------------------

# fd - including hidden directories
fdir() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf-tmux +m) && cd "$dir"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# KILL
# -----------
fkill() {
  pid=$(ps -ef | sed 1d | fzf-tmux -m | awk '{print $2}')

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
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
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

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# get a list of unstaged files and add using fzf
fadd() {
  local files target toplevel
  toplevel=$(git rev-parse --show-toplevel) &&
  files=$(git ls-files --exclude-standard -m -o) &&
  target=$(echo "$files" | fzf-tmux -d $(( 2 + $(wc -l <<< "$files") )) +m) &&
  git add $(echo "$toplevel/$target")
}

# get a list of unstaged files and add using fzf
fdiscard() {
  local files target
  files=$(git diff --name-only) &&
  toplevel=$(git rev-parse --show-toplevel) &&
  target=$(echo "$files" | fzf-tmux -d $(( 2 + $(wc -l <<< "$files") )) +m) &&
  git checkout $(echo "$toplevel/$target")
}

funstage() {
  local files target
  files=$(git diff --name-only --cached) &&
  toplevel=$(git rev-parse --show-toplevel) &&
  target=$(echo "$files" | fzf-tmux -d $(( 2 + $(wc -l <<< "$files") )) +m) &&
  git reset HEAD -- $(echo "$toplevel/$target")
}

# get a list of unstaged files and add using fzf
fdiff() {
  local files target toplevel

  # get project root directory
  toplevel=$(git rev-parse --show-toplevel) &&
  
  # get modified files
  files=$(git diff --name-only) &&
  
  # Create tmux split with a height of the list of items
  target=$(echo "$files" | fzf-tmux -d $(( 2 + $(wc -l <<< "$files") )) +m) &&

  # run diff
  git diff $(echo "$toplevel/$target")
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
  commit=$(echo "$commits" | fzf-tmux --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf-tmux --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | vimpager') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fsha() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf-tmux --tac +s +m -e --ansi --reverse) &&
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
      fzf-tmux --ansi --no-sort --query="$q" --print-query \
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
    cut -c1-80 | fzf-tmux --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

# TMUX
# ---------------
# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fts() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf-tmux --query="$1" --select-1 --exit-0) &&
    tmux switch-client -t "$session"
}

# ftpane - switch pane (@george-b)
# In tmux.conf
# bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"
fpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
      tmux select-window -t $target_window
  fi
}

# fzf + fasd.
v() {
  local file
  file="$(fasd -Rfl "$1" | fzf-tmux -1 -0 --no-sort +m)" && vi "${file}" || return 1
}

c() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf-tmux -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

