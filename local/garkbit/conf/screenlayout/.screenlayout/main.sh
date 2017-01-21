#!/bin/sh
xrandr --output VIRTUAL1 --off \
       --output DP1 --off \
       --output HDMI3 --off \
       --output HDMI2 --mode 1920x1200 --pos 0x0 --rotate normal \
       --output HDMI1 --primary --mode 3840x2160 --dpi 180 --pos 1920x0 --rotate normal \
       --output VGA1 --off


