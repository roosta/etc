User level etc / dotfiles
----
My config files, for Arch Linux. Managed using a Makefile and Stow.
This is a very spesific and personal setup, and requires a fair bit of work outside the scope of this repo.
Use at own risk, but I suggest instead just using this as a template if so inclined.

I don't use a DE or a display manager. I start everything from .zprofile, and pass over control to xinit and choose a WM from there. I prefer i3wm and do most of my work in the terminal(urxvt). My shell is zsh and my editor of choice is Vim.

I've setup my home folder to mirror a root fs structure. I keep my config in ~/etc and have folders such as ~/bin for binaries and ~/var for log and temporary files.

Installation
---
Arch linux needs to be setup with sudo and some other basic amenities before cloning and making this repo makes any sense. I have tried to add what I can to the makefile without it being a bloated mess but it's still a work in progress.

to install simply run ```make``` and from there the makefile should install packages, setup shell and link config and clone dependencies where needed.
