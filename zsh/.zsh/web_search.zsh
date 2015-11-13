# web_search from terminal

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


alias google='web_search google'
alias ddg='web_search duckduckgo'
alias duck='web_search duckduckgo'
alias github='web_search github'
alias devdocs='web_search devdocs'
alias dc='devdocs'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias yt='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias bang='web_search duckduckgo \!'
alias arch='web_search duckduckgo \!aw'
alias aw='web_search duckduckgo \!aw'
alias aur='web_search duckduckgo \!aur'
alias apkg='web_search duckduckgo \!apkg'

