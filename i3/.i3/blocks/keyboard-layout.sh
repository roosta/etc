#!/bin/bash
# source: http://unix.stackexchange.com/a/27688
case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000002") KBD="US" ;;
  "00001002") KBD="NO" ;;
  *) KBD="unknown" ;;
esac
echo $KBD
