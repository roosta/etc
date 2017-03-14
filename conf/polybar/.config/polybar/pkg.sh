#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]; then
  echo "%{B#FBB829 F#2D2B28}%{F-} $pac  $aur %{B#FBB829}"
else
  echo "%{B#2D2B28 F#FCE8C3} $pac  $aur "
fi

# echo "$pac % $aur"
# echo "$pac  $aur"
