default: link-config update-zsh-plugins update-libs show-notes

install: link-config link-misc install-spacemacs set-shell i3-config setup-tmux update-zsh-plugins update-libs add-pacman-repositories install-infinality-keys install-packages show-notes

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

user-fs:
	-@mkdir ~/src
	-@mkdir ~/lib
	-@mkdir ~/bin
	-@mkdir ~/sbin
	-@mkdir -p ~/var/log
	-@mkdir -p ~/var/undo
	-@mkdir ~/.tmp
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
	./scripts/symlink.sh ~/etc/symlinks.txt

link-config:
	stow `ls conf` -R -t ~ -d conf

set-shell:
	chsh -s `which zsh`

update-spacemacs:
	cd ~/.emacs.d && git pull --rebase
	
install-spacemacs:
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d	

i3-config:
	cd ~/etc/conf/i3/.i3/config.d && cat `hostname`.local > ../config && cat *.i3 >> ../config 
	i3-msg reload

setup-tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && . ~/.tmux/plugins/tpm/bindings/install_plugins

show-notes:
	cat ./post_install.txt
