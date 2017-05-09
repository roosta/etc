#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch bars based on hostname
host_name=$(hostname)
case "$host_name" in
  "lintilla")
    echo "got lintilla"
    polybar lintilla-primary -r &
    polybar lintilla-secondary -r &
    polybar lintilla-tertiary -r &
    ;;
  "garkbit")
    polybar garkbit-primary -r &
    polybar garkbit-secondary -r &
    ;;
  "allitnil")
    polybar allitnil -r &
    ;;
esac
