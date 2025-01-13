# ┌──────────────────────────────────────────────────┐
# │░░░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▄█░█▀▀░█▀█░▀█▀░░░░│
# │░░░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░░░░░│
# │░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░░░░░│
# └──────────────────────────────────────────────────┘

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=(
	~/bin
	/usr/local/bin
	$HOME/.go/bin
	~/perl5/bin
	~/.npm/bin
	~/.pip/bin
	~/.cargo/bin
	$path[@]
)

fpath=(
	"$HOME/.zsh.d/functions"
	$fpath[@]
)

# GTK
# export GTK_THEME=Adwaita:dark
# export ADW_DISABLE_PORTAL=1
# export GDK_SCALE=2

export TERMINAL=alacritty
export BROWSER=firefox

# Editor
export EDITOR=nvim
export ALTERNATE_EDITOR=nvim
export VISUAL=nvim

# Golang lib path
export GOPATH=$HOME/.go

export ZSH_CACHE_DIR=$HOME/.cache/zsh

# Set less default opts
export LESS="-R --use-color --mouse --jump-target=12 -DP15.236"

export PAGER=nvimpager
export PARU_PAGER=nvimpager

alias less=$PAGER
# alias zless=$PAGER

# set site.USERBASE for pip user installs
export PYTHONUSERBASE=$HOME/.pip

export ARDUINO_DIR=/usr/share/arduino

export SYSTEMD_EDITOR="/usr/bin/nvim"

if hash ruby 2>/dev/null; then
	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export SSH_AUTH_SOCK=/run/user/$(id -u)/gcr/ssh

# temporary proton audio stutter fix, will improve the situation, but not
# remover the issue entirely
# export PULSE_LATENCY_MSEC=400

if [ -f "${HOME}/Secrets/environment.zsh" ]; then
	source "${HOME}/Secrets/environment.zsh"
fi


if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  # https://github.com/swaywm/sway/wiki#xdg_current_desktop-environment-variable-is-not-being-set
  # https://github.com/flameshot-org/flameshot/blob/master/docs/Sway%20and%20wlroots%20support.md
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export QT_QPA_PLATFORM=wayland
  export XDG_CURRENT_DESKTOP=sway
  export XDG_SESSION_DESKTOP=sway
  export ELECTRON_OZONE_PLATFORM_HINT=wayland
fi

#  vim: set ts=2 sw=2 tw=0 fdm=marker noet :
