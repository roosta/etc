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

add () {
  for arg in "$@"
  do
    if [[ -f "$etc_path/conf/$arg" ]]; then
      git add "$etc_path/conf/$arg" || exit 1
    else
      error_msg "No such file: $arg"
    fi
  done
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
        cd "$etc_path" || exit 1
        git diff "$etc_path/conf/$arg" || exit 1
      else
        error_msg "No such directory: $arg"
      fi
    done
  fi
}
#}}}
link () {
  cd "$etc_path" || exit 1
  make link
}
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
        $EDITOR ~/etc/templates/i3
        ;;
      "rofi")
        $EDITOR ~/etc/templates/rofi/config.rofi
        ;;
      *)
        error_msg "No such config: $arg"
        ;;
    esac
  done
}
#}}}

make-i3 () {
  cd "$etc_path" || exit 1
  make i3
}

make-rofi () {
  cd "$etc_path" || exit 1
  make rofi
}

make-dunst () {
  cd "$etc_path" || exit 1
  make dunst
}

update () {
  cd "$etc_path" || exit 1
  make update
}

run () {
  (( $# >= 1 )) || usage
  case "$1" in
    "commit")
      commit "${@:2}"
      ;;
    "diff")
      diff "${@:2}"
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
    "rofi")
      case "$2" in
        "make")
          make-rofi
          ;;
        *)
          usage
          ;;
      esac
      ;;
    "status")
      stat
      ;;
    "add")
      add "${@:2}"
      ;;
    "edit")
      edit "${@:2}"
      ;;
    "link")
      link
      ;;
    "update")
      update
      ;;
    "help")
      usage
      ;;
    "make")
      cd "$etc_path" && make && cd - || exit 1
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
  link-conf         Symlink conf
  status            get git status
  push              push to origin
  help              show help (this)

EOL
exit 1
}

run "${@}"
