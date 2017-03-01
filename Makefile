HOST ?= $(shell hostname)

default: link update post-install

update: update-zsh-plugins update-libs update-spacemacs update-tmux update-vim post-install

link: link-conf link-misc link-local post-install

install: link init-spacemacs set-shell i3 init-tmux add-pacman-repositories install-yaourt install-packages install-aur-packages update post_install

min: user-fs
	sudo apt-get install `cat min_packages.txt` 
	$(MAKE) set-shell
	stow zsh tmux vim bash -R -t ~ -d conf  
	$(MAKE) init-tmux

install-yaourt:
	@echo -e "\033[0;33mBuild and installing yaourt...\033[0m"
	mkdir ~/etc/build
	cd ~/etc/build && git clone https://aur.archlinux.org/package-query.git
	cd ~/etc/build/package-query && make -si
	cd ~/etc/build && git clone https://aur.archlinux.org/yaourt.git
	cd ~/etc/build/yaourt && make si
	rm -rf ~/etc/build

add-pacman-repositories:
	@echo -e "\033[0;33mAdding pacman repositories...\033[0m"
	cat pacman_repositories.txt | sudo tee -a /etc/pacman.conf

install-aur-packages: install-yaourt 
	@echo -e "\033[0;33mInstalling AUR packages...\033[0m"
	yaourt -S --needed --noconfirm `cat aur_packages.txt`

install-packages: add-pacman-repositiories
	@echo -e "\033[0;33mInstalling packages...\033[0m"
	pacman -S --needed --noconfirm `cat pacman_packages.txt`

enable-services: init-emacs
	@echo -e "\033[0;33mInitialize emacs...\033[0m"
	systemctl --user enable emacs && systemctl --user start emacs
# 	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
# 	sudo systemctl disable systemd-rfkill
# 	sudo tlp start

# Scaffold user fs structure.
# Don't echo to stdout and continue in case of error (-@)
user-fs:
	@echo -e "\033[0;33mCreate user fs...\033[0m"
	-@mkdir ~/src
	-@mkdir ~/lib
	-@mkdir ~/mnt
	-@mkdir ~/tmp
	-@mkdir ~/bin
	-@mkdir ~/sbin
	-@mkdir -p ~/var/log
	-@mkdir -p ~/var/undo
	-@mkdir -p ~/.zsh.d/plugins
	-@mkdir -p ~/.cache/zsh
	-@touch ~/.cache/zsh/dirs

update-zsh-plugins:
	@echo -e "\033[0;33mUpdating zsh plugins...\033[0m"
	./scripts/git_update.sh ~/.zsh.d/plugins ~/etc/zsh_plugins.txt 

update-libs:
	@./scripts/git_update.sh ~/lib ~/etc/lib_repositories.txt 

init-vim: ~/.vim/autoload/plug.vim
	@echo -e "\033[0;33mInitialize Vim...\033[0m"
	@vim -c "exec InstallAndExit()"

update-vim: ~/.vim/autoload/plug.vim
	@echo -e "\033[0;33mUpdating Vim packages...\033[0m"
	@vim -c "exec UpdateAndExit()"

~/.vim/autoload/plug.vim:
	@echo -e "\033[0;33mGetting plugin manager for Vim...\033[0m"
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

clone-src:
	@echo -e "\033[0;33mCloning src...\033[0m"
	ssh-add ~/.ssh/id_rsa
	@./scripts/git_update.sh ~/src ~/etc/src_repositories.txt 

link-misc:
	@echo -e "\033[0;33mSymlinking misc files...\033[0m"
	-@ln -s $(HOME)/src/utils $(HOME)
	-@ln -s $(HOME)/src/colors $(HOME)
	-@ln -s $(HOME)/src/utils/emacs-file-opener.sh $(HOME)/bin/emacs-file-opener
	-@ln -s $(HOME)/Dropbox/org $(HOME)
	-@ln -s $(HOME)/Dropbox/org/TODOs.org $(HOME)/TODOs.org
	-@ln -s $(HOME)/etc/scripts/ftl.sh $(HOME)/bin/ftl
	-@ln -s $(HOME)/lib/LS_COLORS/LS_COLORS $(HOME)/.dircolors
	-@ln -s $(HOME)/src/utils/chdisp_nvidia.sh $(HOME)/bin/chdisp
	-@ln -s $(HOME)/src/utils/touchpad_toggle.sh $(HOME)/bin/touchpad_toggle

link-conf:
	@echo -e "\033[0;33mSymlinking conf...\033[0m"
	@stow $(shell ls conf) -R -t ~ -d conf

link-local:
	@echo -e "\033[0;33mSymlinking local...\033[0m"
	@stow $(shell ls local/$(HOST)/conf) -R -t ~ -d local/$(HOST)/conf 

set-shell:
	@echo -e "\033[0;33mSetting shell to zsh...\033[0m"
	chsh -s `which zsh`

update-spacemacs:
	@echo -e "\033[0;33mUpdating spacemacs...\033[0m"
	@cd ~/.emacs.d && git pull --rebase
	
init-spacemacs: link-conf
	@echo -e "\033[0;33mInitialize spacemacs...\033[0m"
	sudo pacman -S emacs
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d	

~/.i3/config: link-conf
	@echo -e "\033[0;33mCreating i3 config...\033[0m"
	@rm ~/.i3/config
	@cd ~/.i3/config.d && cat $(HOST).local > ../config && cat *.i3 >> ../config

i3: ~/.i3/config
	@echo -e "\033[0;33mReload i3 config...\033[0m"
	@i3-msg reload
	@echo -e "\033[1;32mAll done!\033[0m"

update-tmux:
	@echo -e "\033[0;33mUpdating tmux plugins...\033[0m"
	@. ~/.tmux/plugins/tpm/bin/update_plugins all

init-tmux:
	@echo -e "\033[0;33mInitialize tmux...\033[0m"
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && . ~/.tmux/plugins/tpm/bin/install_plugins

post-install:
	@echo -e "\033[1;32mAll done!\033[0m"

