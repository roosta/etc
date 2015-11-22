```
> ┳━┓┏━┓┏━┓┓━┓┏┓┓┳━┓   ╻  ┳━┓┏━┓┏┓┓┳━┓o┳  ┳━┓┓━┓
> ┃┳┛┃ ┃┃ ┃┗━┓ ┃ ┃━┫  ┏┛  ┃ ┃┃ ┃ ┃ ┣━ ┃┃  ┣━ ┗━┓
> ┇┗┛┛━┛┛━┛━━┛ ┇ ┛ ┇  ╹   ┇━┛┛━┛ ┇ ┇  ┇┇━┛┻━┛━━┛
```

Init|tags|Comment
----|----|-------
ansible|ansible,init,full|Ansible configuration. Task runner this repo uses.
zsh|zsh,init,full|All things zsh. Custom prompts,aliases, completions etc.
bin|bin,init,full|Binary files from other repositories and from [scripts submodule](https://github.com/roosta/scripts)
packages|packages,init|this task is currently broken, unsure if I should even keep it

browser|tags|comment
-------|----|-------
firefox|firefox,browser,full|Generic browser configuration
vimperator|vimperator,browser,full|[Add vi bindings to firefox.](http://www.vimperator.org/vimperator/)
pentadactyl|pentadactyl,browser,full|Fork of vimperator with a different philosophy. Sticks even closer to vim proper

desktop|tags|comment
-------|----|-------
themes|themes,desktop,gtk,full|Desktop themes.
gtk|gtk,desktop,full|Setup gtk theme variables. Relies on external packages.
dunst|dunst,desktop,full|[Desktop notifications](https://github.com/knopwob/dunst)
i3|i3,i3wm,i3-wm,desktop,full|[i3 tiling window manager](http://i3wm.org/)
background|background,bg,full|Desktop backgrounds. Use 'feh' to set on wm startup.
compton|compton,desktop,full|[Compton](https://github.com/chjj/compton) Compositor for X to supplement i3wm which lacks more flashy features. Can also be used to fix tearing issue in i3.
fonts|fonts,desktop,full|Contains custom fonts and logic to set it up on the system by generating cache and setting some X variables. Absent from repo is some restricted fonts like [PragmataPro](http://www.fsd.it/fonts/pragmatapro.htm) which isn't free.
X/Org|x,xorg,desktop,full|Contains system initialization (.xinitrc) which is used to start window manger among other things. Terminal configuration is also here (rxvt-unicode) and other X related stuff.
rofi|rofi,desktop,full|[A window switcher, run dialog and dmenu replacement](https://davedavenport.github.io/rofi/)
ranger|ranger,desktop,full|Terminal file manager with vim like shortcuts

shell|tags|comment
-----|----|-------
dircolors|dircolors,full|Colorful filenames. Using a fork of [LS_COLORS](https://github.com/trapd00r/LS_COLORS)
colors|colors,shell,term,full|[Repo containing color related stuff](https://github.com/roosta/colors)
scripts|scripts,shell,term,full|[collection of scripts I created/curated[https://github.com/roosta/scripts]
ls++|ls++,dircolors,shell,full|[Colorful improved ls command](https://github.com/trapd00r/ls--)
bash|bash,shell,full|Not much here, I use zsh as my primary shell.
boxes|boxes,shell,full|[generate various ASCII art from term, mainly boxes :)](http://boxes.thomasjensen.com/)
fasd|fasd,shell,full|Quick navigation in shell
tmux|tmux,shell,full|Terminal multiplexer. I currently opt out of using this and rely on tiling WM for my term splitting needs. Missing out on other advantages but having some configuration issues with this and urxvt.
screen|screen,shell,full|GNU screen. Same as above.
termite|termite,shell,full|Terminal application similar to rxvt-unicode.

develop|tags|comment
-------|----|-------
lein|lein,leiningen,dev,full|[Automate Clojure projects without setting your hair on fire.](https://github.com/technomancy/leiningen)
npm|npm,dev,full|[Nodejs package manager](https://www.npmjs.com/)
ctags|ctags,dev,full|Generate tags file from language objects found in sourcecode. Useful with vim.
git|git,dev,full|Version Control System
subversion|subversion,svn,dev,full|Version Control System
idea|idea,intellij,dev,full|Intellij IDEA configuration. IDE for java among other languages.
tig|tig,dev,full|ncurses git interface
vim|vim,dev,full|VI Improved. Fantasic editor that at this point am stuck with :) trying anything else just don't sit right.
sublime|st3,subl3,sublime,dev,full| Another editor. Configuration is not maintained. See above.

develop|tags|comment
-------|----|-------
taskwarrior|tasks,taskwarrior,full|Track tasks and todos in terminal.
ncmpcpp|ncmpcpp,full|Music player deamon ncurses based client.
gimp|gimp,full|Photoshop alternative. Currently I'm trying out [krita](https://krita.org/) and really liking it.
xboxdrv|xbox,full|Alternative driver for gamepads in linux. Used until I tried [SteamOS's patched xpad driver](https://aur4.archlinux.org/packages/steamos-xpad-dkms/)

Installation
---
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

*Note: This isn't a completely streamlined setup so stuff is bound to go wrong at some point. I tweak it constantly and are working on a Ansible wrapper script to make the whole business easier.*

Reasoning
---
The dotfiles are manged with [Ansible](http://www.ansible.com/). I maintain several hosts using the the same dotfiles. I used to keeping separate branches and merging from time to time. I always ended up with conflicts, a small disparity between the various hosts. The ansible setup is meant to account for these disparities by maintaining system specific variables located in ```/var/[hostname]```. ~~~In some cases the disparity is so great the host specific config is located in ```.dotfiles/[config]/[config].d/[hostname]``` and sources using a config spesific task~~~

This setup is meant to run locally. Ansible supports a wealth of options, and is meant to be used over ssh but for my needs local setup makes more sense. I might expand in the future. Its also fairly easy to modify or adapt due to the ease of use of ansible. Read the [ansible documentation](http://docs.ansible.com/) for more on that.

Special thanks to these fine folk:
---
*I've drawn inspiration and/or borrowed liberally from these configurations.*
- [xero](https://github.com/xero/dotfiles)
- [trapd00r](https://github.com/trapd00r/configs)
- [dotshare.it contributers](http://dotshare.it/)
- [Unixporn subreddit](https://www.reddit.com/r/unixporn/)
