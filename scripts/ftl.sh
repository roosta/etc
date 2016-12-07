#!/bin/bash

etc_path=$HOME/etc

error_msg() {
  echo "$1"
  exit 1
}

## Git  {{{1
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
        cd $etc_path
        git diff "$etc_path/conf/$arg" || exit 1
      else
        error_msg "No such directory: $arg"
      fi
    done
  fi
}
#}}}
## edit {{{1
edit () {
  for arg in "$@"
  do
    case "$arg" in
      "git")
        $EDITOR ~/.gitconfig
        ;;
      "ssh")
        $EDITOR ~/.ssh/config
        ;;
      "alias")
        $EDITOR ~/.zsh.d/aliases.zsh
        ;;
      "vim")
        vim ~/.vimrc
        ;;
      "xresources")
        $EDITOR ~/.Xresources ~/.Xresources.d/*
        ;;
      "tmux")
        $EDITOR ~/.tmux.conf
        ;;
      "xinitrc")
        $EDITOR ~/.xinitrc
        ;;
      "font")
        $EDITOR ~/.config/fontconfig/fonts.conf
        ;;
      "xbindkeys")
        $EDITOR ~/.xbindkeyssrc
        ;;
      "vimp")
        $EDITOR ~/.vimperatorrc
        ;;
      "gtk")
        $EDITOR ~/.gtkrc-2.0 ~/.config/gtk-3.0/settings.ini
        ;;
      "lein")
        $EDITOR ~/.lein/profiles.clj
        ;;
      "urxvt")
        $EDITOR ~/.Xresources.d/urxvt.xresources
        ;;
      "termite")
        $EDITOR ~/.config/termite/config
        ;;
      "env")
        $EDITOR ~/.zshenv
        ;;
      "zshrc")
        $EDITOR ~/.zshrc
        ;;
      "zsh")
        $EDITOR ~/.zsh.d
        ;;
      "org")
        emacsclient -t ~/org
        ;;
      "todo")
        emacsclient -t ~/org/TODOs.org
        ;;
      "mutt")
        $EDITOR ~/.muttrc
        ;;
      "i3")
        $EDITOR ~/.i3
        ;;
      *)
        error_msg "No such config: $arg"
        ;;
    esac
  done
}
#}}}

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
    "edit")
      edit ${@:2}
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
  commit            stage a folder and commit using git
  status            get git status
  push              push to origin
  help              show help (this)

EOL
	exit 1
}

run "${@}"
