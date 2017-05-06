#!/bin/bash
# fix th
# source: http://unix.stackexchange.com/a/27688
case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000"|"00000002"|"00000003") KBD=" US " ;;
  "00001000"|"00001002"|"00001003") KBD="%{F#FCE8C3 B#F75341} NO %{F- B-}" ;;
  *) KBD="unknown" ;;
esac

case "$(xset -q | grep Caps|awk '{print $4}')" in
  "off") CAPS="";;
  "on") CAPS="%{F#FCE8C3 B#F75341} Caps Lock %{F- B-}";;
  *) CAPS="Something went wrong";;
esac

echo "$KBD $CAPS"
