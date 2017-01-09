# System clipboard integration
#
# A "safer" copy to clipboard made for Pass and SSH
# Copies only first line and clears clipboard after 30 secondsz

# safecopy - Copy head of string to clipboard
#
# Usage:
#
#  ssh remote-host [remote command] | safecopy    - copies stdin to local clipboard
#
function safecopy() {
emulate -L zsh
local file=$1
if which xsel &>/dev/null; then
  if [[ -z $file ]]; then
    head -1 | xsel --clipboard --input 
  else
    print "clipsafe: not a string" >&2
    return 1
  fi
  ( sleep 30 ; xsel -bc ) &
else
  print "clipsafe: xsel not installed" >&2
  return 1
fi
}
