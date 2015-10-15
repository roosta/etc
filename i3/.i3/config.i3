# ┌───────────────────────────────────┐
# │▀▀▀░░░░░░░▀█▀░▀▀█░█░█░█▄█░░░░░░░▀▀▀│
# │▀▀▀▀▀░░░░░░█░░░▀▄░█▄█░█░█░░░░░▀▀▀▀▀│
# │▀▀▀▀▀▀▀░░░▀▀▀░▀▀░░▀░▀░▀░▀░░░▀▀▀▀▀▀▀│
# │▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀│
# │ Author: Roosta <mail@roosta.sh>   │
# │ Site  : http://dotfiles.roosta.sh │
# │ Github: https://github.com/roosta │
# └────────┬──────────────────────────┘
# Sources: │
# ┌────────┘
# │ http://i3wm.org/docs/user-contributed/lzap-config.html
# │ http://dotshare.it (picked from various i3 confs, color schemes..etc)
# ┆
#
# ┬  ┬─┐┐ ┬┌─┐┬ ┐┌┐┐
# │  │─┤└┌┘│ ││ │ │
# ┆─┘┘ ┆ ┆ ┘─┘┆─┘ ┆
# └─────────────── ─ ─
# Numbers in front is for sorting order on i3bar.
# In each bar numbers are stripped. See bar config below.

# ┆ Primary workspaces
# └── ─ ─
set $PWS1_TRM "1Q:Term"
set $PWS2_DEV "2W:Devel"
set $PWS3_WWW "3E:Web"

bindsym $mod+q workspace $PWS1_TRM
bindsym $mod+w workspace $PWS2_DEV
bindsym $mod+e workspace $PWS3_WWW

bindsym $mod+Shift+q move workspace $PWS1_TRM
bindsym $mod+Shift+w move workspace $PWS2_DEV
bindsym $mod+Shift+e move workspace $PWS3_WWW

# ┆ Secondary workspaces
# └── ─ ─
set $SWS1_AUX "4A:Aux"
set $SWS2_COM "5S:Comms"
set $SWS3_DBG "6D:Debug"

bindsym $mod+a workspace $SWS1_AUX
bindsym $mod+s workspace $SWS2_COM
bindsym $mod+d workspace $SWS3_DBG

bindsym $mod+Shift+a move workspace $SWS1_AUX
bindsym $mod+Shift+s move workspace $SWS2_COM
bindsym $mod+Shift+d move workspace $SWS3_DBG

# ┆ Tertiary workspaces
# └── ─ ─
set $TWS1_MED "7:1:Media"
set $TWS2_GAM "8:2:Games"
set $TWS3_MSC "9:3:Misc"

bindsym $mod+1 workspace $TWS1_MED
bindsym $mod+2 workspace $TWS2_GAM
bindsym $mod+3 workspace $TWS3_MSC

bindsym $mod+Shift+1 move workspace $TWS1_MED
bindsym $mod+Shift+2 move workspace $TWS2_GAM
bindsym $mod+Shift+3 move workspace $TWS3_MSC

# ┆ outputs
# └── ─ ─
set $primary DVI-I-1
set $secondary DVI-D-0
set $television HDMI-0

workspace $PWS1_TRM output $primary
workspace $PWS3_WWW output $primary
workspace $PWS2_DEV output $primary

workspace $SWS1_AUX output $secondary
workspace $SWS3_DBG output $secondary
workspace $SWS2_COM output $secondary

# ┆ Options
# └── ─ ─
focus_follows_mouse no
new_window 1pixel
hide_edge_borders none

# ┐ ┬o┌┐┐┬─┐┌─┐┐ ┬  ┬─┐┬ ┐┬  ┬─┐┐─┐
# ││││││││ ││ ││││  │┬┘│ ││  ├─ └─┐
# └┴┆┆┆└┘┆─┘┘─┘└┴┆  ┆└┘┆─┘┆─┘┴─┘──┘
# └─────────────── ─ ─

# ┆ assignments
# └── ─ ─
assign [class="(?i)subl3"] $PWS2_DEV
assign [class="(?i)atom"] $PWS2_DEV
assign [class="(?i)firefox"] $PWS3_WWW
assign [instance="^Devtools$$"] $SWS3_DBG
assign [class="(?i)thunderbird"] $SWS2_COM
assign [class="(?i)google-chrome$"] $TWS1_MED
assign [class="(?i)google-chrome-beta$"] $SWS3_DBG
assign [class="(?i)steam"] $TWS2_GAM
assign [class="(?i)spotify"] $TWS1_MED
assign [class="(?i)pidgin"] $SWS2_COM
assign [class="(?i)linphone"] $SWS2_COM

# assign [class="(?i)gimp"] $PWS2_DEV
# assign [class="(?i)urxvt"] $PWS1_TRM

# ┆ General rules
# └── ─ ─
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [window_role="bubble"] floating enable
for_window [window_role="Preferences"] floating enable
for_window [title="Preferences$"] floating enable

# ┆ spesific rules
# └── ─ ─
for_window [class="(?i)Jitsi"] floating enable
for_window [class="(?i)SessionManager"] floating enable
for_window [class="(?i)firefox"]  new_window pixel 0
for_window [title="(?i)Steam - Update News(.*)"]  floating enable
for_window [title="(?i)Friends"]  floating enable
for_window [class="(?i)linphone"] floating enable
#for_window [class="(?i)Pidgin"] floating enable
#for_window [class="(?i)Pidgin"] floating_maximum_size 50 x 75
#for_window [class="(?i)thunderbird"] floating enable

# ┬─┐┬ ┐┌┐┐┌─┐┐─┐┌┐┐┬─┐┬─┐┌┐┐
# │─┤│ │ │ │ │└─┐ │ │─┤│┬┘ │
# ┘ ┆┆─┘ ┆ ┘─┘──┘ ┆ ┘ ┆┆└┘ ┆
# └───────────────────────── ─ ─

exec urxvtc
#exec --no-startup-id "i3-msg 'workspace 5S:Comms; append_layout ~/.i3/workspace/comms_ws.json'"
#exec firefox
#exec thunderbird
#exec pidgin
# exec urxvtc
#exec spotify
#exec steam

# ┬─┐┬─┐┬─┐┬─┐┬─┐┬─┐┬─┐┌┐┐┌─┐┬─┐
# │─┤│─┘│─┘├─ │─┤│┬┘│─┤││││  ├─
# ┘ ┆┆  ┆  ┴─┘┘ ┆┆└┘┘ ┆┆└┘└─┘┴─┘
# └──────────────────────────── ─ ─

# ┆ define fonts
# └── ─ ─
#set $font_lintilla -*-terminesspowerline-*-*-normal-*-12-*-*-*-*-*-*-*
set $font_lintilla pango: Essential PragmataPro 12px
set $font_allitnil pango: Essential PragmataPro 15px
set $font_status_allitnil pango: Essential PragmataPro 14px
set $font_status_lintilla -*-terminusicons2-*-*-*-*-12-*-*-*-*-*-*-*
#set $font_lintilla pango: Essential PragmataPro 14px
#set $font_status_lintilla pango: PragmataPro for Powerline 10px, pango: FontAwesome 10px
#set $font_status_lintilla pango: FontAwesome 14px

# ┆ set main font
# └── ─ ─
font $font_lintilla

# ┆ define colors (gruvbox <3)
# └── ─ ─
set $gruvbg #282828
set $gruvfg #ebdbb2
set $gruvbgSoft #32302f
set $gruvbgHard #1d2021
set $gruvbgUnfocused #1C1C1C
set $gruvBlack #282828
set $gruvDarkGray #928374
set $gruvDarkRed #cc241d
set $gruvRed #fb4934
set $gruvDarkGreen #98971a
set $gruvGreen #b8bb26
set $gruvDarkYellow #d79921
set $gruvYelllow #fabd2f
set $gruvDarkBlue #458588
set $gruvBlue #83a598
set $gruvDarkMagenta #b16286
set $gruvMagenta #d3869b
set $gruvDarkCyan #689d6a
set $gruvCyan #8ec07c
set $gruvLightGray #a89984
set $gruvWhite #ebdbb2
set $gruvDarkOrange #D55C0D
set $gruvOrange #FC7F18
set $gruvbg0_h #1C1F20
set $gruvbg0_s #312F2E
set $gruvbg0 #272727
set $gruvbg1 #3B3735
set $gruvbg2 #4F4844
set $gruvbg3 #655B53
set $gruvbg4 #7B6E63
set $gruvGray #918273
set $gruvfg4 #A79883
set $gruvfg3 #BCAD92
set $gruvfg2 #D4C3A0
set $gruvfg1 #E9DAB1
set $gruvfg0 #F9EFC6

# ┆ window colors
# └── ─ ─
# <class> <border> <bg> <fg> <indicator>
client.focused $gruvbgHard $gruvDarkMagenta $gruvfg $gruvDarkCyan
client.focused_inactive $gruvbgHard $gruvbg0 $gruvfg $gruvbgSoft
client.unfocused $gruvbghard $gruvbg $gruvDarkGray $gruvDarkCyan
client.urgent $gruvDarkOrange $gruvDarkOrange $gruvbg $gruvDarkOrange
client.placeholder $gruvCyan $gruvDarkCyan $gruvBlack $gruvMagenta

# ┆ bar primary
# └── ─ ─
bar {
  output $primary
  output $television
  tray_output primary
  strip_workspace_numbers yes
  position top
  font $font_status_lintilla
  status_command i3blocks -c ~/.i3/i3blocks/lint_primary.conf
  separator_symbol "|"
  colors {
    # <bar>
    background $gruvbg0
    separator $gruvbgSoft
    statusline $gruvfg

    # <workclass> <border> <bg> <text>
    focused_workspace $gruvbgHard $gruvbgSoft $gruvMagenta
    active_workspace $gruvbgHard $gruvbgSoft $gruvfg
    inactive_workspace $gruvbgHard $gruvbg $gruvDarkGray
    urgent_workspace $gruvDarkOrange $gruvDarkOrange $gruvBlack
  }
}

# ┆ bar secondary
# └── ─ ─
bar {
  output $secondary
  tray_output all
  status_command i3blocks -c ~/.i3/i3blocks/lint_secondary.conf
  strip_workspace_numbers yes
  font $font_status_lintilla
  position top
  separator_symbol "|"
  colors {
    # <bar>
    background $gruvbg
    separator $gruvbgSoft
    statusline $gruvfg

    # <workclass> <border> <bg> <text>
    focused_workspace $gruvbgHard $gruvbgSoft $gruvMagenta
    active_workspace $gruvbgHard $gruvbgSoft $gruvfg
    inactive_workspace $gruvbgHard $gruvbg $gruvDarkGray
    urgent_workspace $gruvDarkOrange $gruvDarkOrange $gruvBlack
  }
}

# ┬┌ ┬─┐┐ ┬┬─┐o┌┐┐┬─┐┐─┐
# ├┴┐├─ └┌┘│─││││││ │└─┐
# ┆ ┘┴─┘ ┆ ┆─┘┆┆└┘┆─┘──┘
# └───────────────────── ─ ─

# set modkey (Super key)
set $mod Mod4

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# manual screen lock
# bindsym $mod+Shift+o exec --no-startup-id xset s activate

# start a terminal
#bindsym $mod+Return exec urxvtc -e zsh -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session"
#bindsym $mod+Return exec urxvtc -e tmux
bindsym $mod+Return exec urxvtc

# kill focused window
bindsym $mod+c kill

# start dmenu that only lists .desktop entries.
#bindsym $mod+d exec --no-startup-id j4-dmenu-desktop --dmenu='dmenu -fn "Essential PragmataPro-10" -nb "#402E2E" -nf "#C0B18B" -sb "#4A3637" -sf "#7B8748" -b -i' --term="urxvtc"
#bindsym $mod+d exec --no-startup-id dmenu_run -fn "Essential PragmataPro-10" -nb "#402E2E" -nf "#C0B18B" -sb "#4A3637" -sf "#7B8748" -b -i
bindsym $mod+Tab exec --no-startup-id rofi -show run
bindsym $mod+grave exec --no-startup-id rofi -show window

# vi movement
# change focus
#bindsym $mod+j focus left
#bindsym $mod+k focus down
#bindsym $mod+l focus up
#bindsym $mod+semicolon focus right

# move focused window
#bindsym $mod+Shift+j move left
#bindsym $mod+Shift+k move down
#bindsym $mod+Shift+l move up
#bindsym $mod+Shift+semicolon move right

# cursor keys to change focus:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# choose split direction.
# Swapped the modes here since I couln't make senso of the orientation as is.
bindsym $mod+h split v
bindsym $mod+v split h

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout
bindsym $mod+Control+Shift+t layout tabbed
bindsym $mod+Shift+t layout toggle split
bindsym $mod+t layout toggle

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# border changing
bindsym $mod+b border toggle

# scratchpad
bindsym $mod+m move scratchpad
bindsym $mod+o scratchpad show

# toggle touchpad
bindsym $mod+Shift+o exec --no-startup-id ~/bin/touchpad-toggle

# move to last workspace
bindsym $mod+z workspace back_and_forth

# move windows back and forth
bindsym $mod+Shift+z move container to workspace back_and_forth

# jump to previous workspace by hitting first ws button again
#workspace_auto_back_and_forth yes

bindsym $mod+Control+Shift+left move container to output left
bindsym $mod+Control+Shift+right move container to output right

bindsym $mod+p focus parent
bindsym $mod+Shift+p focus child

# screenshot
# source: https://github.com/Airblader/dotfiles-manjaro
bindsym --release Print exec scrot $HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png
bindsym --release Shift+Print exec scrot -s $HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png

# send a signal to i3blocks on caps to toggle layout
bindsym --release Caps_Lock exec pkill -SIGRTMIN+11 i3blocks

# send signal to i3blocks on volume change and update volume script.
# currently unoprable since xbindkeys hijacks these keys for reasons I haven't looked into
#bindsym 123 exec pkill -SIGRTMIN+12 i3blocks
#bindsym 122 exec pkill -SIGRTMIN+12 i3blocks
#bindsym 121 exec pkill -SIGRTMIN+12 i3blocks

# ┌┌┐┬─┐┌┐┐┬ ┐┐─┐
# │││├─ ││││ │└─┐
# ┘ ┆┴─┘┆└┘┆─┘──┘
# └─────────────── ─ ─

# ┆ Resize
# └── ─ ─
mode "resize" {
  # vi movement
  bindsym h resize shrink width 10 px or 10 ppt
  bindsym j resize grow height 10 px or 10 ppt
  bindsym k resize shrink height 10 px or 10 ppt
  bindsym l resize grow width 10 px or 10 ppt

  # same bindings, but for the arrow keys
  bindsym Left resize shrink width 10 px or 10 ppt
  bindsym Down resize grow height 10 px or 10 ppt
  bindsym Up resize shrink height 10 px or 10 ppt
  bindsym Right resize grow width 10 px or 10 ppt

  # width
  #bindsym minus resize shrink width 10 px or 10 ppt
  #bindsym plus resize grow width 10 px or 10 ppt
  #bindsym KP_Substract resize shrink width 10 px or 10 ppt
  #bindsym KP_Add resize grow width 10 px or 10 ppt

  ## height
  #bindsym $mod+KP_Substract resize grow height 10 px or 10 ppt
  #bindsym $mod+KP_Add resize shrink height 10 px or 10 ppt
  #bindsym $mod+minus resize grow height 10 px or 10 ppt
  #bindsym $mod+plus resize shrink height 10 px or 10 ppt

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

# ┆ System
# └── ─ ─
# https://wiki.archlinux.org/index.php/I3#Shutdown.2C_reboot.2C_lock_screen
# fast way to reach power settings for system. Requires polkit.

#set $Locker i3lock --image=$HOME/.backgrounds/pattern-01.png -t && sleep 1
set $Locker xscreensaver-command --lock
set $mode_system System: (l) lock, (e) logout, (s) suspend, (r) reboot, (Shift+s) shutdown
mode "$mode_system" {
  bindsym l exec --no-startup-id $Locker, mode "default"
  bindsym e exec --no-startup-id i3-msg exit, mode "default"
  bindsym s exec --no-startup-id $Locker && systemctl suspend, mode "default"
  bindsym r exec --no-startup-id systemctl reboot, mode "default"
  bindsym Shift+s exec --no-startup-id systemctl poweroff -i, mode "default"

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}
# bind FN sleep key to menu
bindsym XF86Sleep mode "$mode_system"
bindsym $mod+End mode "$mode_system"

# ┆ Output
# └── ─ ─
# Quickly switch output based on presets
# Script is in the submodule "scripts". Alternativly http://github.com/roosta/scripts

set $changeto ~/bin/chmon
set $mode_chmon Layout: (d) desk, (t) TV, (a) all
mode "$mode_chmon" {
  bindsym d exec --no-startup-id $changeto desk, mode "default"
  bindsym t exec --no-startup-id $changeto tv, mode "default"
  bindsym a exec --no-startup-id $changeto all, mode "default"

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}
# bind FN home key to menu
bindsym XF86HomePage mode "$mode_chmon"
bindsym $mod+Home mode "$mode_chmon"

#┌────────── ─ ─
# vim:ft=i3:ts=2
#└─────────── ─ ─
