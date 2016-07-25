default: add-pacman-repositories install-packages link-config set-shell show-notes

install-packages:
	sudo pacman -Sy yaourt
	yaourt -S --needed --noconfirm `cat packages.txt`

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

link-config:
	stow `ls conf` -R -t ~ -d conf

set-shell:
	chsh -s `which zsh`

show-notes:
	cat ./post_install.txt
