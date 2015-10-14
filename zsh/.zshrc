# vim:ft=zsh:ts=2:sw=2
# ┌────────────────────────────────────┐
# │░░░░░░░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀░░░░░░░░│
# │░░░░░░░░░▄▀░░▀▀█░█▀█░█▀▄░█░░░░░░░░░░│
# │░░░░░░░░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░░░░░░░░│
# ├────────────────────────────────────┤
# │ Author : Roosta <mail@roosta.sh>   │
# │ Site   : http://dotfiles.roosta.sh │
# │ Github : https://github.com/roosta │
# └────────────────────────────────────┘
# Info:
# Zsh config files. Configs are modularized in ~/.zsh/*
# Config is picked up here and there and crediting all the places I got snippets is a lost cause.
# But large thanks to Xero who's zsh conf influenced me the most and I'll add attribution where appropriate
# and/or where I can remember I got it from.

# sources:
# https://github.com/xero/dotfiles
# https://dotfiles.github.io/

# source the configs
for config (~/.zsh/*.zsh) source $config

