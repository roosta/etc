default: link-conf symlink link-local show-notes

update: update-zsh-plugins update-libs update-spacemacs update-tmux show-notes

install: link-config link-misc install-spacemacs set-shell i3-config setup-tmux update-zsh-plugins update-libs add-pacman-repositories install-infinality-keys install-yaourt install-packages show-notes

install-packages:
	sudo pacman -Sy yaourt
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

symlink:
	./scripts/symlink.sh ~/etc/symlinks.txt

link-conf:
	stow `ls conf` -R -t ~ -d conf

link-local:
	stow `ls local/$(hostname)` -R -t ~ -d local/$(hostname) 

set-shell:
	chsh -s `which zsh`

update-spacemacs:
	cd ~/.emacs.d && git pull --rebase
	
install-spacemacs:
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d	

i3-config:
	cd ~/etc/conf/i3/.i3/config.d && cat `hostname`.local > ../config && cat *.i3 >> ../config 
	i3-msg reload

update-tmux:
	. ~/.tmux/plugins/tpm/bin/update_plugins all

setup-tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && . ~/.tmux/plugins/tpm/bin/install_plugins

install-yaourt:
	./scripts/install_yaourt.sh

show-notes:
	cat ./post_install.txt
