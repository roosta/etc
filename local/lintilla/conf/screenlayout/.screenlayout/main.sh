#!/bin/sh
xrandr --output DVI-I-1 --auto --left-of DP-1 \
       --output DP-1 --primary --auto --dpi 192 \
       --output HDMI-0 --auto --right-of DP-1 
