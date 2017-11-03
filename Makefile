HOST ?= $(shell hostname)
NOW = $(shell date +"%Y-%m-%d@%T")

include ~/etc/local/$(HOST)/variables.mk

.PHONY: default
default: links update i3 rofi post-install

.PHONY: update
update: update-zsh-plugins update-libs update-spacemacs update-tmux update-vim post-install

.PHONY: links
links: link-conf link-misc link-local post-install

.PHONY: install
install: install-pacaur install-packages install-aur-packages save-originals init-spacemacs set-shell clone-source i3 rofi init-tmux links post-install

.PHONY: min
min: min-install save-originals user-fs update-libs set-shell update-zsh-plugins min-links init-vim init-tmux
	-@ln -s $(HOME)/lib/LS_COLORS/LS_COLORS $(HOME)/.dircolors

.PHONY: min-install
min-install:
	sudo apt-get install < min_packages.txt

.PHONY: min-links
min-links:
	stow zsh git tmux vim bash -R -t ~ -d conf

.PHONY: install-pacaur
install-pacaur:
	@echo -e "\033[0;33mBuild and install pacur...\033[0m"
	mkdir ~/etc/build
	cd ~/etc/build && git clone https://aur.archlinux.org/pacaur.git
	cd ~/etc/build/pacaur && makepkg -si --noconfirm --needed
	rm -rf ~/etc/build

# add-pacman-repositories:
# 	@echo -e "\033[0;33mAdding pacman repositories...\033[0m"
# 	cat pacman_repositories.txt | sudo tee -a /etc/pacman.conf

.PHONY: install-aur-packages
install-aur-packages: install-pacaur
	@echo -e "\033[0;33mInstalling AUR packages...\033[0m"
	pacaur -S --needed --noconfirm - < aur_packages.txt

.PHONY: install-packages
install-packages:
	@echo -e "\033[0;33mInstalling packages...\033[0m"
	sudo pacman --needed -S - < pkglist.txt

.PHONY: enable-services
enable-services: init-emacs
	@echo -e "\033[0;33mInitialize emacs...\033[0m"
	systemctl --user enable emacs && systemctl --user start emacs

# Scaffold user fs structure.
# Don't echo to stdout and continue in case of error (-@)
.PHONY: user-fs
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
	-@mkdir -p ~/.cache/zsh
	-@mkdir -p ~/backup
	-@touch ~/.cache/zsh/dirs

.PHONY: update-zsh-plugins
update-zsh-plugins:
	@echo -e "\033[0;33mUpdating zsh plugins...\033[0m"
	./scripts/git_update.sh ~/.zsh.d/plugins ~/etc/zsh_plugins.txt

.PHONY: update-libs
update-libs:
	@./scripts/git_update.sh ~/lib ~/etc/lib_repositories.txt

.PHONY: init-vim
init-vim: ~/.vim/autoload/plug.vim
	@echo -e "\033[0;33mInitialize Vim...\033[0m"
	@vim -c "exec InstallAndExit()"

.PHONY: update-vim
update-vim: ~/.vim/autoload/plug.vim
	@echo -e "\033[0;33mUpdating Vim packages...\033[0m"
	@vim -c "exec UpdateAndExit()"

~/.vim/autoload/plug.vim:
	@echo -e "\033[0;33mGetting plugin manager for Vim...\033[0m"
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: clone-src
clone-src:
	@echo -e "\033[0;33mCloning src...\033[0m"
	@ssh-add -l &>/dev/null || ssh-add ~/.ssh/id_rsa
	@./scripts/git_update.sh ~/src ~/etc/src_repositories.txt

.PHONY: clone-org
clone-org:
	@echo -e "\033[0;33mCloning org...\033[0m"
	@ssh-add -l &>/dev/null || ssh-add ~/.ssh/id_rsa
	@git clone git@github.com:roosta/org.git $(HOME)

.PHONY: clone-misc
link-misc:
	@echo -e "\033[0;33mSymlinking misc files...\033[0m"
	-@ln -f -s $(HOME)/src/utils $(HOME) &>/dev/null
	-@ln -f -s $(HOME)/src/colors $(HOME) &>/dev/null
	-@ln -f -s $(HOME)/src/utils/emacs-file-opener.sh $(HOME)/bin/emacs-file-opener &>/dev/null
	-@ln -f -s $(HOME)/etc/scripts/ftl.sh $(HOME)/bin/ftl &>/dev/null
	-@ln -f -s $(HOME)/lib/LS_COLORS/LS_COLORS $(HOME)/.dircolors &>/dev/null
	-@ln -f -s $(HOME)/src/utils/touchpad-toggle.sh $(HOME)/bin/touchpad-toggle &>/dev/null
	-@ln -f -s $(HOME)/utils/tmux-dev-session.sh $(HOME)/bin/tdev &>/dev/null
	-@ln -f -s $(HOME)/utils/tmux-update-window.sh $(HOME)/bin/tupd &>/dev/null

.PHONY: link-conf
link-conf:
	@echo -e "\033[0;33mSymlinking conf...\033[0m"
	@stow $(shell ls conf) -R -t ~ -d conf --ignore="md|org"

.PHONY: link-local
link-local:
	@echo -e "\033[0;33mSymlinking local...\033[0m"
	@stow $(shell ls local/$(HOST)/conf) -R -t ~ -d local/$(HOST)/conf

.PHONY: set-shell
set-shell:
	@echo -e "\033[0;33mSetting shell to zsh...\033[0m"
	chsh -s `which zsh`

.PHONY: update-spacemacs
update-spacemacs:
	@echo -e "\033[0;33mUpdating spacemacs...\033[0m"
	@cd ~/.emacs.d && git pull --rebase

.PHONY: init-spacemacs
init-spacemacs: link-conf
	@echo -e "\033[0;33mInitialize spacemacs...\033[0m"
	sudo pacman -S emacs
	git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d

~/.i3/config: link-conf ~/etc/local/$(HOST)/variables.mk ~/etc/templates/i3/*.i3
	@echo -e "\033[0;33mCreating i3 config...\033[0m"
	@cd ~/etc/templates/i3 && cat *.i3 > ~/.i3/config
ifdef primary_monitor
	@echo "set \$$primary_monitor $(primary_monitor)" >> ~/.i3/config
endif
ifdef secondary_monitor
	@echo "set \$$secondary_monitor $(secondary_monitor)" >> ~/.i3/config
endif
ifdef tertiary_monitor
	@echo "set \$$tertiary_monitor $(tertiary_monitor)" >> ~/.i3/config
endif

.PHONY: i3
i3: ~/.i3/config
	@echo -e "\033[0;33mReload i3 config...\033[0m"
	@i3-msg reload
	@echo -e "\033[1;32mAll done!\033[0m"

# clear-rofi:
# 	@rm ~/.config/rofi/config -f

~/.config/rofi/config: ~/etc/templates/rofi/config.rofi ~/etc/local/$(HOST)/variables.mk
	@cd ~/etc/templates/rofi && cat *.rofi > ~/.config/rofi/config
ifdef bar_height
	@echo  "rofi.yoffset: $(bar_height)" >> ~/.config/rofi/config
endif
ifdef lines
	@echo "rofi.lines: $(lines)" >> ~/.config/rofi/config
endif

.PHONY: rofi
rofi: ~/.config/rofi/config
	@echo -e "\033[0;33mCreating rofi config...\033[0m"

.PHONY: update-tmux
update-tmux:
	@echo -e "\033[0;33mUpdating tmux plugins...\033[0m"
	@. ~/.tmux/plugins/tpm/bin/update_plugins all

.PHONY: init-tmux
init-tmux:
	@echo -e "\033[0;33mInitialize tmux...\033[0m"
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

.PHONY: save-originals
save-originals:
	@mkdir ~/backup/original-system-files@$(NOW)
	@mv ~/.bash* ~/backup/original-system-files@$(NOW)

.PHONY: post-install
post-install:
	@echo -e "\033[1;32mAll done!\033[0m"
