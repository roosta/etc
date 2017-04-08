#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]; then
  echo "$pac/$aur%{T5}%{T-}"
else
  echo "$pac/$aur%{T5}%{T-}"
fi
