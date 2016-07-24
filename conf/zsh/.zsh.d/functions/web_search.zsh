# web_search from terminal
# copied from oh-my-zsh. TODO: Add attribution

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    google      "https://www.google.com/search?q="
    duckduckgo  "https://www.duckduckgo.com/?q="
    github      "https://github.com/search?q="
    devdocs     "http://devdocs.io/#q="
  )

  # define the open command
  case "$OSTYPE" in
    darwin*)  open_cmd="open" ;;
    cygwin*)  open_cmd="cygstart" ;;
    linux*)   open_cmd="xdg-open" ;;
    *)        echo "Platform $OSTYPE not supported"
              return 1
              ;;
  esac

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  nohup $open_cmd "$url" &>/dev/null
}


