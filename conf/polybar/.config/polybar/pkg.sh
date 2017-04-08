#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]; then
  echo "$pac/$aur %{F#0AAEB3 T5}%{F- T-}"
else
  echo "$pac/$aur %{T5}%{T-}"
fi
