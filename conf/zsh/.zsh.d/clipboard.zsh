# https://unix.stackexchange.com/questions/258579/copypaste-in-zsh
x-yank() {
    zle copy-region-as-kill
    print -rn -- $CUTBUFFER | xsel --clipboard --input
    zle deactivate-region
}
zle -N x-yank

# x-cut() {
#     zle kill-region
#     print -rn -- $CUTBUFFER | xsel --clipboard --input
# }

zle -N x-cut
x-paste() {
    CUTBUFFER=$(xsel --clipboard --output)
    zle yank
}

zle -N x-paste

bindkey -M vicmd "y" x-yank
bindkey -M vicmd "p" x-paste
# bindkey -M vicmd "d" x-cut
