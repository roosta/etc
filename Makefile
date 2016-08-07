default: add-pacman-repositories install-packages create-user-fs link-config set-shell show-notes

install-packages:
	sudo pacman -Sy yaourt
	yaourt -S --needed --noconfirm `cat pacman_packages.txt`

add-pacman-repositories: add-infinality-key
	cat repositories.txt | sudo tee -a /etc/pacman.conf

add-infinality-key:
	sudo dirmngr &
	sleep 1
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58

# enable-services:
# 	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
# 	sudo systemctl disable systemd-rfkill
# 	sudo tlp start

create-user-fs:
	-@mkdir ~/dev
	-@mkdir ~/lib
	-@mkdir ~/bin
	-@mkdir ~/sbin
	-@mkdir -p ~/var/log
	-@mkdir -p ~/var/undo
	-@mkdir ~/.tmp
	-@mkdir ~/.cache

setup-zsh: create-user-fs
	-@mkdir ~/.zsh.d/plugins
	-@touch ~/.cache/zsh/dirs

update-zsh-plugins:
	./scripts/git_update.sh ~/.zsh.d/plugins ~/etc/zsh_plugins.txt 

update-libs:
	./scripts/git_update.sh ~/lib ~/etc/lib_repositories.txt 

link-config:
	stow `ls conf` -R -t ~ -d conf

set-shell:
	chsh -s `which zsh`

show-notes:
	cat ./post_install.txt
