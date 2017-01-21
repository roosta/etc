HOST ?= $(shell hostname)

default: link-conf symlink link-local show-notes

update: update-zsh-plugins update-libs update-spacemacs update-tmux show-notes

install: link-config link-misc install-spacemacs set-shell i3-config setup-tmux update-zsh-plugins update-libs add-pacman-repositories install-infinality-keys install-yaourt install-packages show-notes

install-packages:
	yaourt -S --needed --noconfirm `cat pacman_packages.txt`

add-pacman-repositories: add-infinality-key
	cat pacman_repositories.txt | sudo tee -a /etc/pacman.conf

add-infinality-key:
	sudo echo "cache sudo passwd"
	sudo dirmngr &
	sleep 1
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58

enable-services:
	systemctl --user enable emacs && systemctl --user start emacs
# 	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
# 	sudo systemctl disable systemd-rfkill
# 	sudo tlp start

# Scaffold user fs structure.
# Don't echo to stdout and continue in case of error (-@)
user-fs:
	-@mkdir ~/src
	-@mkdir ~/lib
	-@mkdir ~/tmp
	-@mkdir ~/bin
	-@mkdir ~/sbin
	-@mkdir -p ~/var/log
	-@mkdir -p ~/var/undo
	-@mkdir ~/.cache
	-@mkdir ~/.zsh.d/plugins
	-@touch ~/.cache/zsh/dirs

update-zsh-plugins:
	./scripts/git_update.sh ~/.zsh.d/plugins ~/etc/zsh_plugins.txt 

update-libs:
	./scripts/git_update.sh ~/lib ~/etc/lib_repositories.txt 

clone-src:
	ssh-add ~/.ssh/id_rsa
	./scripts/git_update.sh ~/src ~/etc/src_repositories.txt 

link-misc:
	-@ln -s $(HOME)/src/utils /home/roosta/
	-@ln -s $(HOME)/src/colors /home/roosta/
	-@ln -s $(HOME)/src/utils/emacs-file-opener.sh /home/roosta/bin/emacs-file-opener
	-@ln -s $(HOME)/Dropbox/org /home/roosta/
	-@ln -s $(HOME)/Dropbox/org/TODOs.org /home/roosta/TODOs.org
	-@ln -s $(HOME)/etc/scripts/ftl.sh /home/roosta/bin/ftl
	-@ln -s $(HOME)/lib/LS_COLORS/LS_COLORS /home/roosta/.dircolors
	-@ln -s $(HOME)/src/utils/chdisp_nvidia.sh /home/roosta/bin/chdisp
	-@ln -s $(HOME)/src/utils/touchpad_toggle.sh /home/roosta/bin/touchpad_toggle

link-conf:
	stow $(shell ls conf) -R -t ~ -d conf

link-local:
	stow $(shell ls local/$(HOST)/conf) -R -t ~ -d local/$(HOST)/conf 

set-shell:
	chsh -s `which zsh`

update-spacemacs:
	cd ~/.emacs.d && git pull --rebase
	
init-spacemacs:
	sudo pacman -S emacs
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d	

i3:
	cd ~/etc/conf/i3/.i3/config.d && cat `hostname`.local > ../config && cat *.i3 >> ../config 
	i3-msg reload

update-tmux:
	. ~/.tmux/plugins/tpm/bin/update_plugins all

init-tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && . ~/.tmux/plugins/tpm/bin/install_plugins

install-yaourt:
	mkdir ~/etc/build
	cd ~/etc/build && git clone https://aur.archlinux.org/package-query.git
	cd ~/etc/build/package-query && make -si
	cd ~/etc/build && git clone https://aur.archlinux.org/yaourt.git
	cd ~/etc/build/yaourt && make si
	rm -rf ~/etc/build

post-install:
	echo "All done!"

