#!/bin/sh
# ┌─────────────┐
# │░▀█▀░▀█▀░█░█░│
# │░░█░░░█░░░█░░│
# │░░▀░░░▀░░░▀░░│
# └─────────────┘

if [ "$TERM" = "linux" ]; then
  source ~/.zsh/gruvbox.zsh
  exec tmux
fi

