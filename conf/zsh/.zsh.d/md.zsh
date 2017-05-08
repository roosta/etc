# read markdown files like manpages
# https://github.com/xero/dotfiles/blob/master/zsh/.zsh/aliases.zsh
function md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}

