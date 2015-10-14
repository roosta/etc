#!/bin/sh
# ┌─────────────┐
# │░▀█▀░▀█▀░█░█░│
# │░░█░░░█░░░█░░│
# │░░▀░░░▀░░░▀░░│
# └─────────────┘

if [ "$TERM" = "linux" ]; then

  # change colors to sweetlove
/bin/echo -e "
  \e]P01f1f1f
  \e]P1d17b49
  \e]P27b8748
  \e]P3af865a
  \e]P4535c5c
  \e]P5775759
  \e]P66d715e
  \e]P7c0b18b
  \e]P8402e2e
  \e]P9ac5d2f
  \e]PA647035
  \e]PB8f6840
  \e]PC444b4b
  \e]PD614445
  \e]PE585c49
  \e]PF978965
  "
  # get rid of artifacts
  clear

  # lanch tmux
  exec tmux
fi

# reuse colors defined in .Xresources
#if [ "$TERM" = "linux" ]; then
    #_SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    #for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | \
               #awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        #echo -en "$i"
    #done
    #clear
#fi

