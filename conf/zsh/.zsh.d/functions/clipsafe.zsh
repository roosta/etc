# System clipboard integration
#
# This file has support for doing system clipboard copy and paste operations
# from the command line in a generic cross-platform fashion.
#
# On OS X and Windows, the main system clipboard or "pasteboard" is used. On other
# Unix-like OSes, this considers the X Windows CLIPBOARD selection to be the
# "system clipboard", and the X Windows `xclip` command must be installed.

# clipcopy - Copy data to clipboard
#
# Usage:
#
#  <command> | clipcopy    - copies stdin to clipboard
#
#  clipcopy <file>         - copies a file's contents to clipboard
#
# copied from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/clipboard.zsh
function safecopy() {
emulate -L zsh
local file=$1
if which xsel &>/dev/null; then
  if [[ -z $file ]]; then
    head -1 | xsel --clipboard --input 
  else
    cat "$file" | xsel --clipboard --input
  fi
  ( sleep 30 ; xsel -bc ) &
else
  print "clipsafe: xsel not installed" >&2
  return 1
fi
}
