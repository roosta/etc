#!/bin/bash
etc_path=$HOME/etc
error_msg() {
  echo "$1"
  exit 1
}

commit () {
  for arg in "$@"
  do
    if [[ -d "$etc_path/conf/$arg" ]]; then
      cd "$etc_path/conf/$arg" || exit 1
      git add .
    else
      error_msg "No such directory: $arg"
    fi
  done
  git commit
}

stat () {
  cd "$etc_path" || exit 1
  git status
}

push () {
  cd "$etc_path" || exit 1
  git push
}

# get config diff if arg is provided
# else diff entire etc tree
diff () {
  if (( $# < 1 )); then
    git diff "$etc_path"
  else
    for arg in "$@"
    do
      if [[ -d "$etc_path/conf/$arg" ]]; then
        git diff "$etc_path/conf/$arg" || exit 1
      else
        error_msg "No such directory: $arg"
      fi
    done
  fi
}

make-i3 () {
 cd "$etc_path"
 make i3-config
}

run () {
  (( $# >= 1 )) || usage
  case "$1" in
    "commit")
      commit ${@:2}
      ;;
    "diff")
      diff ${@:2}
      ;;
    "i3")
      # if [[ -n "$2" ]]; then
      case "$2" in
        "make")
          make-i3
          ;;
        *)
          usage
          ;;
      esac
      ;;
    "status")
      stat
      ;;
    "help")
      usage
      ;;
    *)
      usage
  esac
}

usage() {
	cat >&2 <<EOL
FATLINE
───────
Helper script for etc/dotfiles

Usage: fatline command option

commands:
  commit                stage a folder and commit using git
  status                get git status
  push                  push to origin
  help                  show help (this)

EOL
	exit 1
}

run "${@}"
