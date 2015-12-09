Roosta's dotfiles
=========
Ansible managaged dotfiles.

Installation
------------
1. clone repository and install Ansible using your local package manager.
2. Next a host variables needs to be created named after the hostname of the current machine. I suggest running:
```shell
cat vars/lintilla > [hostname]
```
and changing the values to match your system.
3. Navigate to the root folder and run:
```shell
ansible-playbook -i ansible/hosts dotfiles -t init
```
to initialize the needed config to get the setup running smoothly. After that each config has its own task, and are grouped by tag words. If I wanted to install everything in one run:
```shell
ansible-playbook -t full
```
or if I only want, say i3 and zsh configs, I would run:
```shell
ansible-playbook -t i3 zsh
```

*See dotfiles.yml for parent task runner. All tags are managed from there and tasks reside in tasks/[config]*

Rationale
---------
The dotfiles are manged with [Ansible](http://www.ansible.com/). I maintain several hosts using the the same dotfiles. I used to keeping separate branches and merging from time to time. I always ended up with conflicts, a small disparity between the various hosts. The ansible setup is meant to account for these disparities by maintaining system specific variables located in ```/var/[hostname]```.

In some cases the  it makes more sense to keep config in ```.dotfiles/[config]/[config].d/[hostname]``` and source via main config file. (xinitrc being an example)

This setup is built to run locally. Ansible supports a wealth of options to remotely manage over ssh but for my needs local setup makes more sense.  It fairly easy to modify or adapt due to the ease of use of ansible and only a few values needs to change to run remotely. Read the [ansible documentation](http://docs.ansible.com/) for more on that.

Links:
========
###### Dotfiles:
- https://github.com/xero/dotfiles
- https://github.com/trapd00r/configs
- http://dotshare.it/
- https://github.com/holman/dotfiles
- https://github.com/ryanb/dotfiles
- https://github.com/tpope/tpope
- https://github.com/ObliviousGmn/Dotfiles
- https://github.com/nim-/dotfiles
- https://github.com/junegunn/dotfiles
- https://github.com/sykora/etc
- https://github.com/webpro/awesome-dotfiles


###### Management
- https://github.com/joeyh/etckeeper
- https://www.vagrantup.com/
- https://help.github.com/articles/remove-sensitive-data/
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- https://github.com/anishathalye/dotbot
- https://github.com/RichiH/vcsh
- https://github.com/StackExchange/blackbox
- http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
- https://github.com/spencergibb/battleschool
- https://github.com/ansible/ansible-modules-extras
- http://jinja.pocoo.org/docs/dev/templates/
- https://gist.github.com/marktheunissen/2979474

###### Misc
- https://www.reddit.com/r/unixporn/
- https://github.com/sindresorhus/awesome
