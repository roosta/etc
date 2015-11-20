```
┌───────────────────────────────────────────────────────────────────────────────┐
│█▀▀▀▀▀█░░░█▀▄░█▀█░█▀█░█▀▀░▀█▀░█▀█░░▀░░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀░░░█▀▀▀▀▀█│
│█▀▀▀▀▀█░░░█▀▄░█░█░█░█░▀▀█░░█░░█▀█░░░░░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█░░░█▀▀▀▀▀█│
│█▀▀▀▀▀▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░░▀░░▀░▀░░▀░░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀▀▀▀█│
│███████████████████████████████████████████████████████████████████████████████│
├┬─────────────────────────────────────┬─┬──────────────────────────────────────┘
├┤ Author : Roosta <mail@roosta.sh>    ├┬┘
├┤ Site   : http://dotfiles.roosta.sh  ├┘
├┤ Github : https://github.com/roosta  │
┆├────────────────────┬┬───────────────┘
 │ Table of contents: ├┘
┆├────────────────────┘
├┘
│ o┌┐┐o┌┐┐
│ │││││ │
│ ┆┆└┘┆ ┆
├───────┘
├─ ansible     tags=ansible,init,full
├─ zsh         tags=zsh,init,full
├─ bin         tags=bin,init,full
│
│ ┬─┐┬─┐┌─┐┐ ┬┐─┐┬─┐┬─┐
│ │─││┬┘│ ││││└─┐├─ │┬┘
│ ┆─┘┆└┘┘─┘└┴┆──┘┴─┘┆└┘
├────────────┘
├─ firefox     tags=firefox,browser,full
├─ pentadactyl tags=pentadactyl,browser,full
├─ vimperator  tags=vimperator,browser,full
│
│ ┬─┐┬─┐┐─┐┬┌ ┌┐┐┌─┐┬─┐
│ │ │├─ └─┐├┴┐ │ │ ││─┘
│ ┆─┘┴─┘──┘┆ ┘ ┆ ┘─┘┆  
├──────────────┘
├─ themes      tags=themes,desktop,gtk,full
├─ gtk         tags=gtk,desktop,full
├─ dunst       tags=dunst,desktop,full
├─ i3          tags=i3,i3wm,i3├─wm,desktop,full
├─ background  tags=background,bg,full
├─ compton     tags=compton,desktop,full
├─ fonts       tags=fonts,desktop,full
├─ x           tags=x,xorg,desktop,full
├─ rofi        tags=rofi,desktop,full
│
│ ┐─┐┬ ┬┬─┐┬  ┬  
│ └─┐│─┤├─ │  │  
│ ──┘┆ ┴┴─┘┆─┘┆─┘
├──────────┘
├─ dircolors   tags=dircolors,full
├─ colors      tags=colors,shell,term,full
├─ scripts     tags=scripts,shell,term,full
├─ ls++        tags=ls++,dircolors,shell,full
├─ bash        tags=bash,shell,full
├─ boxes       tags=boxes,shell,full
├─ fasd        tags=fasd,shell,full
├─ tmux        tags=tmux,shell,full
├─ screen      tags=screen,shell,full
├─ termite     tags=termite,shell,full
│
│ ┬─┐┬─┐┐ ┬
│ │ │├─ │┌┘
│ ┆─┘┴─┘└┘
├────────┘
├─ lein        tags=lein,leiningen,dev,full
├─ npm         tags=npm,dev,full
├─ ctags       tags=ctags,dev,full
├─ git         tags=git,dev,full
├─ subversion  tags=subversion,svn,dev,full
├─ idea        tags=idea,intellij,dev,full
├─ tig         tags=tig,dev,full
├─ vim         tags=vim,dev,full
├─ sublime     tags=st3,subl3,sublime,dev,full
│
│ ┌┌┐o┐─┐┌─┐
│ ││││└─┐│  
│ ┘ ┆┆──┘└─┘
├────┘
├─ taskwarrior tags=tasks,taskwarrior,full
├─ ncmpcpp     tags=ncmpcpp,full
├─ gimp        tags=gimp,full
├─ xboxdrv     tags=xbox,full
├────┘
├──────────────┬
┆              +      
┆              #      OS: Arch Linux x86_64
              ###     Kernel Release: 4.2.5-1-ARCH
             #####    WM: i3
             ######   DE: None
            ; #####;  $EDITOR: vim
           +##.#####
          +##########
         #############;
        ###############+
       #######   #######
     .######;     ;###;`".
    .#######;     ;#####.
    #########.   .########`
   ######'           '######
  ;####                 ####;
  ##'                     '##
 #'                         `#
```
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
