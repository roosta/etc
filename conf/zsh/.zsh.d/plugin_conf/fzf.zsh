# ┬─┐┬ ┐┌─┐┌─┐┐ ┬  ┬─┐o┌┐┐┬─┐┬─┐┬─┐
# ├─ │ │┌─┘┌─┘└┌┘──├─ │││││ │├─ │┬┘
# ┆  ┆─┘└─┘└─┘ ┆   ┆  ┆┆└┘┆─┘┴─┘┆└┘
# OPTIONS:{{{
# ---------------
# plugin handled externally with vim-plug
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Respecting .gitignore, .hgignore, and svn:ignore
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --hidden --smart-case --ignore-file ~/.globalignore --files'

export FZF_DEFAULT_OPTS='
  --color fg:15,bg:0,hl:2,fg+:15,bg+:8,hl+:10
  --color info:11,prompt:5,spinner:11,pointer:10,marker:208,header:15
'
export FZF_COMPLETION_TRIGGER='~~'

# To apply the command to CTRL-T as well
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#}}}
# COMMAND HISTORY: {{{
# -------------------

# fh - repeat history
fhist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf-tmux +s --tac | sed 's/ *[0-9]* *//')
}
#}}}
# CHANGING DIRECTORY {{{
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

# choose a directory from zshs dirs cache file
d() {
  local target
  file="$HOME/.cache/zsh/dirs" &&
  height=$(( 2 + $(wc -l < "$file") )) &&
  target=$(fzf-tmux +m +s < "$file" -d "$height") &&
  cd "$target"
}
#}}}
# KILL {{{
# -----------
fkill() {
  pid=$(ps -ef | sed 1d | fzf-tmux -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}
#}}}
# OPENING FILES {{{
# ---------------

# Fuzzy match file and open with emacsclient
e() {
  if [ "$#" -ne 0 ]; then
    emacsclient -nw $@
  else
    local file
    file=$(fzf-tmux --query="$1")
    [ -n "$file" ] && emacsclient -nw "$file"
  fi
}

# Fuzzy match file and open with vim
v() {
  if [ "$#" -ne 0 ]; then
    vim $@
  else
    local file
    file=$(fzf-tmux --query="$1")
    [ -n "$file" ] && vim "$file"
  fi
}

# To to org folder and open match
o() {
  local file
  cd ~/org && file=$(fzf-tmux --query="$1") && 
  [ -n "$file" ] && emacsclient -nw "$file" && cd -
}

#}}}
# GIT {{{
# ---------

# get a list of unstaged files and add using fzf, supports multiselect via [tab] as default
fadd() {
  local files target toplevel
  toplevel=$(git rev-parse --show-toplevel) &&
  files=$(git ls-files --exclude-standard -m -o --full-name) &&
  target=$(echo "$files" | fzf-tmux -m -d $(( 2 + $(wc -l <<< "$files") ))) &&
  while IFS='' read -r line || [[ -n "$line" ]]; do
    git add "${toplevel}/${line}"
  done <<< "$target"
}

# Discard selected files unstaged changes
# supports multiselect via [tab] as default
fdiscard() {
  local files target toplevel
  toplevel=$(git rev-parse --show-toplevel) &&
  files=$(git diff --name-only) &&
  target=$(echo "$files" | fzf-tmux -m -d $(( 2 + $(wc -l <<< "$files") ))) &&
  while IFS='' read -r line || [[ -n "$line" ]]; do
    git checkout "${toplevel}/${line}"
  done <<< "$target"
}

# Unstage selected files
# supports multiselect via [tab] as default
funstage() {
  local files target toplevel
  toplevel=$(git rev-parse --show-toplevel) &&
  files=$(git diff --name-only --cached) &&
  target=$(echo "$files" | fzf-tmux -m -d $(( 2 + $(wc -l <<< "$files") ))) &&
  while IFS='' read -r line || [[ -n "$line" ]]; do
    git reset HEAD -- "${toplevel}/${line}"
  done <<< "$target"
}

# diff selected file
fdiff() {
  local files target toplevel

  # get project root directory
  toplevel=$(git rev-parse --show-toplevel) &&

  # get modified files
  files=$(git diff --name-only) &&

  # Create tmux split with a height of the list of items
  target=$(echo "$files" | fzf-tmux -d $(( 2 + $(wc -l <<< "$files") )) +m) &&

  # run diff
  git diff "$toplevel/$target"
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
  commits=$(git log --graph --color=always --pretty=oneline --format="%C(auto)%h%d %s %C(black)%C(white)%cr" --abbrev-commit) &&
  commit=$(echo "$commits" | fzf-tmux --ansi +s +m -e) &&
  git checkout $(echo "$commit" | grep -oe "[0-9a-f]\{5,32\}")
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(white)%cr" "$@" |
  fzf-tmux --ansi --no-sort --tiebreak=index --bind=ctrl-s:toggle-sort \
    --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | vimpager') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fsha - get git commit sha
# example usage: git rebase -i `fsha`
fsha() {
  local commits commit
  commits=$(git log --graph --color=always --pretty=oneline --format="%C(auto)%h%d %s %C(black)%C(white)%cr" --abbrev-commit) &&
  commit=$(echo "$commits" | fzf-tmux +s +m -e --ansi) &&
  echo -n $(echo "$commit" | grep -oe "[0-9a-f]\{5,32\}")
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
#}}}
# TAGS {{{
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
#}}}
# TMUX {{{
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

#{{{ Unused
# ftpane - switch pane (@george-b)
# In tmux.conf
# bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"
# Doen't work currently
# fpane() {
#   local panes current_window current_pane target target_window target_pane
#   panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
#   current_pane=$(tmux display-message -p '#I:#P')
#   current_window=$(tmux display-message -p '#I')

#   target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

#   target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
#   target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

#   if [[ $current_window -eq $target_window ]]; then
#     tmux select-pane -t ${target_window}.${target_pane}
#   else
#     tmux select-pane -t ${target_window}.${target_pane} &&
#     tmux select-window -t $target_window
#   fi
# }
#}}}

# In tmux.conf
# bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"

#}}}
# FASD {{{
# --------
v() {
  local file
  file="$(fasd -Rfl "$1" | fzf-tmux --no-sort +m -d 40%)" && vi "${file}" || return 1
}

c() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf-tmux --no-sort +m -d 40%)" && cd "${dir}" || return 1
}
#}}}
# AG {{{
# ------

# search using ag and open selected file at linum
fv() {
  local match linum file;
  match=$(\ag \
    --nobreak \
    --smart-case \
    --hidden  \
    -p ~/.agignore \
    --noheading . | fzf-tmux +m) &&

    linum=$(echo "$match" | cut -d':' -f2) &&
    file=$(echo "$match" | cut -d':' -f1) &&

    emacsclient -nw +$linum $file
}

falias() {
  local match;
  match=$(cat ~/.zsh.d/aliases.zsh -n | fzf-tmux +m --reverse --preview="echo {1}") &&
    echo $match

  # cat aliases.zsh|sed -n '4,5p'
    # linum=$(echo "$match" | cut -d':' -f2) &&
    # file=$(echo "$match" | cut -d':' -f1) &&

    # ${EDITOR:-vim} +$linum $file
}

#}}}
#  vim: set ts=2 sw=2 tw=0 fdm=marker et :
