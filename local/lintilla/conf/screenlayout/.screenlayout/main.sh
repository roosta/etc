#!/bin/sh
xrandr --output DVI-D-0 --mode 1920x1080 --pos 0x0 --rotate normal \
       --output HDMI-0 --mode 1920x1080 --pos 5760x0 --rotate normal \
       --output DP-1 --primary --mode 3840x2160 --pos 1920x0 --rotate normal --dpi 192 \
       --output DVI-I-0 --off --output DP-1 --off --output DP-0 --off \
