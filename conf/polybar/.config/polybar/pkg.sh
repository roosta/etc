#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]; then
  echo "$pac/$aur"
else
  echo "$pac/$aur"
fi

# check=$((pac + aur))
# if [[ "$check" != "0" ]]; then
#   echo "$pac/$aur"
# else
#   echo "$pac/$aur"
# fi
