#!/bin/sh
xrandr --output DVI-D-0 --mode 1920x1080 --left-of DP-1 --scale 2x2 \
       --output DP-1 --primary --mode 3840x2160 --dpi 192 \
       --output HDMI-0 --mode 1920x1080 --right-of DP-1 --scale 2x2
