HOST ?= $(shell hostname)

default: link update post-install

update: update-zsh-plugins update-libs update-spacemacs update-tmux update-vim post-install

link: link-conf link-misc link-local post-install

install: link init-spacemacs set-shell i3 init-tmux add-pacman-repositories install-infinality-keys install-yaourt install-packages update post_install

install-yaourt:
	mkdir ~/etc/build
	cd ~/etc/build && git clone https://aur.archlinux.org/package-query.git
	cd ~/etc/build/package-query && make -si
	cd ~/etc/build && git clone https://aur.archlinux.org/yaourt.git
	cd ~/etc/build/yaourt && make si
	rm -rf ~/etc/build

add-infinality-key:
	sudo echo "cache sudo passwd"
	sudo dirmngr &
	sleep 1
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58

add-pacman-repositories: add-infinality-key
	cat pacman_repositories.txt | sudo tee -a /etc/pacman.conf

install-packages: install-yaourt add-pacman-repositiories
	yaourt -S --needed --noconfirm `cat pacman_packages.txt`

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

init-vim: ~/.vim/autoload/plug.vim
	vim -c "exec InstallAndExit()"

update-vim: ~/.vim/autoload/plug.vim
	vim -c "exec UpdateAndExit()"

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
	
init-spacemacs: link-conf
	sudo pacman -S emacs
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d	

~/.i3/config: link-conf
	rm ~/.i3/config
	cd ~/.i3/config.d && cat $(HOST).local > ../config && cat *.i3 >> ../config

i3: ~/.i3/config
	i3-msg reload

update-tmux:
	. ~/.tmux/plugins/tpm/bin/update_plugins all

init-tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && . ~/.tmux/plugins/tpm/bin/install_plugins

post-install:
	echo "All done!"

