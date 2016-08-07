#!/bin/bash
error_msg() {
  echo "missing argument(s)"
  exit 1
}

# take two args. Parent folder and repositories text file.
# loop over each repo in text file, attempting to clone
git_clone () {
(( $# == 2 )) || error_msg

cd "$1" || exit

if [[ -f "$2" ]]; then
  while read -r repo; do

    # ignore blank lines
    if [ "$repo" != "" ]; then

      # save command output
      out=$(git clone "$repo" 2>&1)

      # if clone was unsuccessful try to enter folder and pull
      if [[ $out =~ fatal ]]; then
        dest=$(echo "$out" | awk '{print substr($4, 2, length($4) - 2)}') 
        # echo $dest
        cd "$1"/"$dest" || exit
        git pull
        cd .. || exit
      else
        echo "$out"
      fi
    fi

  done <"$2"
else
  error_msg
fi
}

# source: https://github.com/MaxWinterstein/check_git_pullstatus/blob/master/check_git_pullstatus.sh 
git_pull() {
  cd "$2" || exit

  if [ "$(git log --pretty=%H ...refs/heads/master^ | head -n 1)" = "$(git ls-remote origin -h refs/heads/master |cut -f1)" ]; then
    status=0
    statustxt="up to date"
  else
    status=2
    git pull
    statustxt="not up to date, pulling latest changes"
  fi

  if [[ $(git status --porcelain) ]]; then
    status=1
    statustxt="uncommited"
  fi


  echo "$status git_status_$1 - $statustxt"
}

git_clone "${@}"
# git_pull
