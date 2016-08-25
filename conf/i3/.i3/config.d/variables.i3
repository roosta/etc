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
set $fullrestart "ansible-playbook $HOME/.dotfiles/dotfiles.yml -t i3"
#set $fullreload "ansible-playbook $HOME/.dotfiles/dotfiles.yml -t i3 && i3-msg reload"

# define palette
set $black          "#1C1B19"
set $red            "#FF3128"
set $green          "#519F50"
set $yellow         "#FBB829"
set $blue           "#5573A3"
set $magenta        "#E02C6D"
set $cyan           "#1693A5"
set $gray           "#918175"
set $bright_black   "#2D2B28"
set $bright_red     "#DA4939"
set $bright_green   "#98BC37"
set $bright_yellow  "#FFC66D"
set $bright_blue    "#6D9CBE"
set $bright_magenta "#E35682"
set $bright_cyan    "#34BEDA"
set $white          "#FCE8C3"
set $orange         "#D75F00"
set $bright_orange  "#FF8700"
set $hard_black     "#080808"
set $alt_gray       "#4E4E4E"

# primary workspaces
set $PWS1_TRM "1[Q]TERM"
set $PWS2_DEV "2[W]EDIT"
set $PWS3_WWW "3[E]WWW"

# secondary workspaces
set $SWS1_AUX "4[A]MISC"
set $SWS2_COM "5[S]COMS"
set $SWS3_DBG "6[D]DEBUG"

# Tertiary workspaces
set $TWS1_MED "7[1]MEDIA"
set $TWS2_GAM "8[2]GAME"
set $TWS3_ART "9[3]GFX"

# Auxiliary workspaces
set $FWS1  "9[F1]"
set $FWS2 "10[F2]"
set $FWS3 "11[F3]"
set $FWS4 "12[F4]"
set $FWS5 "13[F5]"
set $FWS6 "14[F6]"
set $FWS7 "15[F7]"
set $FWS8 "16[F8]"

