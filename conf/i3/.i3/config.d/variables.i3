# ------------------- 
# VARIABLES
# -------------------
# fast way to reach power settings for system. Requires polkit.
set $locker xscreensaver-command --lock
#set $locker i3lock --image=$HOME/.background/pattern-01.png -t && sleep 1

# tmux session management
# set $term urxvtc -e bash -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -s main"
# set $term termite -e "bash -c 'tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -s main'"
set $term termite

# set scrot/screenshot file arguments
set $screenshot "$HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d@%H-%M-%S).png"

# generate new config with ansible and reload i3
# set $fullrestart "ansible-playbook $HOME/.dotfiles/dotfiles.yml -t i3"
#set $fullreload "ansible-playbook $HOME/.dotfiles/dotfiles.yml -t i3 && i3-msg reload"

# define palette
set_from_resource $black          i3wm.color0    #1C1B19
set_from_resource $red            i3wm.color1    #FF3128
set_from_resource $green          i3wm.color2    #519F50
set_from_resource $yellow         i3wm.color3    #FBB829
set_from_resource $blue           i3wm.color4    #5573A3
set_from_resource $magenta        i3wm.color5    #E02C6D
set_from_resource $cyan           i3wm.color6    #1693A5
set_from_resource $gray           i3wm.color7    #918175
set_from_resource $bright_black   i3wm.color8    #2D2B28
set_from_resource $bright_red     i3wm.color9    #DA4939
set_from_resource $bright_green   i3wm.color10   #98BC37
set_from_resource $bright_yellow  i3wm.color11   #FFC66D
set_from_resource $bright_blue    i3wm.color12   #6D9CBE
set_from_resource $bright_magenta i3wm.color.13  #E35682
set_from_resource $bright_cyan    i3wm.color.14  #34BEDA
set_from_resource $white          i3wm.color15   #FCE8C3
set_from_resource $orange         i3wm.color.166 #D75F00
set_from_resource $bright_orange  i3wm.color208  #FF8700
set_from_resource $hard_black     i3wm.color232  #080808
set_from_resource $alt_gray       i3wm.color239  #4E4E4E

# primary workspaces
set $PWS1 "1[Q]TERM"
set $PWS2 "2[W]EDIT"
set $PWS3 "3[E]WWW"

# secondary workspaces
set $SWS1 "4[A]DBG_TERM"
set $SWS2 "5[S]DBG_FIREFOX"
set $SWS3 "6[D]DBG_CHROME"

# Tertiary workspaces
set $TWS1 "7[1]MEDIA"
set $TWS2 "8[2]GAME"
set $TWS3 "9[3]GFX"

# Auxiliary workspaces
set $FWS1  "9[F1]CHAT"
set $FWS2  "10[F2]EMAIL"
set $FWS3  "11[F3]DL"
set $FWS4  "12[F4]"
set $FWS5  "13[F5]"
set $FWS6  "14[F6]"
set $FWS7  "15[F7]"
set $FWS8  "16[F8]"
set $FWS9  "17[F9]"
set $FWS10 "18[F10]"
set $FWS11 "19[F11]"
set $FWS12 "20[F12]"

