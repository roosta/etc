# ┌────────────────────────────────────┐
# │░░░░░░░░░░░▀█▀░▀▀█░█░█░█▄█░░░░░░░░░░│
# │░░░░░░░░░░░░█░░░▀▄░█▄█░█░█░░░░░░░░░░│
# │░░░░░░░░░░░▀▀▀░▀▀░░▀░▀░▀░▀░░░░░░░░░░│
# ├────────────────────────────────────┤
# │ Author : Roosta <mail@roosta.sh>   │
# │ Site   : http://dotfiles.roosta.sh │
# │ Github : https://github.com/roosta │
# └────────────────────────────────────┘
# Sources:
# * http://i3wm.org/docs/user-contributed/lzap-config.html
# * http://dotshare.it (picked from various i3 confs, color schemes..etc)
# ───────────────────────────────────────────────────────────────────────

# ─────────────  Layout  ──────────────
#set $primary_monitor DVI-I-1
#set $secondary_monitor DVI-D-0
#set $television HDMI-1

set $primary_monitor VGA1
set $secondary_monitor LVDS1

set $WS1 "1:TRM"
set $WS2 "2:DEV"
set $WS3 "3:WEB"
set $WS4 "4:AUX"
set $WS5 "5:MED"
set $WS6 "6:GAM"
set $WS7 "7:MSC"
set $WS8 "8:MSC"

bindsym $mod+1 workspace $WS1
bindsym $mod+2 workspace $WS2
bindsym $mod+3 workspace $WS3
bindsym $mod+4 workspace $WS4
bindsym $mod+5 workspace $WS5
bindsym $mod+6 workspace $WS6
bindsym $mod+7 workspace $WS7
bindsym $mod+8 workspace $WS8

bindsym $mod+Shift+1 move workspace number $WS1
bindsym $mod+Shift+2 move workspace number $WS2
bindsym $mod+Shift+3 move workspace number $WS3
bindsym $mod+Shift+4 move workspace number $WS4
bindsym $mod+Shift+5 move workspace number $WS5
bindsym $mod+Shift+6 move workspace number $WS6
bindsym $mod+Shift+7 move workspace number $WS7
bindsym $mod+Shift+8 move workspace number $WS8

workspace $WS1 output $primary_monitor
workspace $WS2 output $primary_monitor
workspace $WS3 output $primary_monitor
workspace $WS4 output $secondary_monitor

# set border size
new_window 1pixel
hide_edge_borders none

# fix graphics glitch
#assign [class="URxvt"] $WS1
assign [class="subl3"] $WS2
assign [class="Atom"] $WS2
assign [class="Firefox"] $WS3
assign [class="chrome"] $WS5
assign [class="Steam"] $WS6
assign [class="Spotify"] $WS5

for_window [window_role="pop-up"] floating enableor_window [window_role="bubble"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [window_role="Preferences"] floating enable

# set float for spesific apps
for_window [class="(?i)Jitsi"] floating enable
for_window [class="SessionManager"] floating enable
for_window [class="Firefox"]  new_window pixel 0
for_window [title="Steam - Update News(.*)"]  floating enable
for_window [title="Friends"]  floating enable

# ─────────────  Appearance  ──────────────
# assign various fonts
set $font_lintilla pango: Essential PragmataPro 14px
set $font_allitnil pango: Essential PragmataPro 15px
set $font_status_allitnil pango: Essential PragmataPro 14px
set $font_status_lintilla -*-terminusicons2-medium-r-normal--12-*-72-72-c-60-iso8859-*

# set used font
font $font_lintilla

# define gruv colors
set $gruvbg #282828
set $gruvfg #ebdbb2
set $gruvbgSoft #32302f
set $gruvbgHard #1d2021
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

# <class>, <border>, <bg>, <fg>, <indicator>
client.focused $gruvDarkMagenta $gruvbgSoft $gruvfg $gruvDarkMagenta
client.focused_inactive $gruvDarkGray $gruvDarkGray $gruvfg $gruvbgsoft
client.unfocused $gruvfg4 $gruvbgsoft $gruvfg4 $gruvbghard
client.urgent $gruvDarkOrange $gruvDarkOrange $gruvbg $gruvDarkOrange
client.placeholder $gruvbgsoft $gruvbgsoft $gruvbgsoft $gruvMagenta

bar {
  position top
  tray_output primary
  font $font_status_lintilla
  status_command i3blocks -c ~/.i3/i3blocks/transform.conf
  #separator_symbol "Ý"
  separator_symbol " - "
  colors {

    # <bar>
    background $gruvbgsoft
    separator $gruvGray
    #statusline  #ffffff

    # <class>, <border>, <bg>, <text>
    focused_workspace $gruvDarkMagenta $gruvbgsoft $gruvfg
    active_workspace $gruvDarkGray $gruvbgsoft $gruvfg
    inactive_workspace $gruvbgsoft $gruvbgsoft $gruvDarkGray
    urgent_workspace $gruvDarkOrange $gruvDarkOrange $gruvbg
  }
}
# ──────────────── Misc ────────────────
focus_follows_mouse no

# ────────────── Keybinds ──────────────
# set modkey (Super key)
set $mod Mod4

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# manual screen lock
# bindsym $mod+Shift+o exec --no-startup-id xset s activate

# start a terminal
#bindsym $mod+Return exec urxvtc -e zsh -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session"
#bindsym $mod+Return exec urxvtc -e tmux
bindsym $mod+Return exec --no-startup-id urxvtc

# kill focused window
bindsym $mod+q kill

# start dmenu that only lists .desktop entries.
#bindsym $mod+d exec --no-startup-id j4-dmenu-desktop --dmenu='dmenu -fn "Essential PragmataPro-10" -nb "#402E2E" -nf "#C0B18B" -sb "#4A3637" -sf "#7B8748" -b -i' --term="urxvtc"
#bindsym $mod+d exec --no-startup-id dmenu_run -fn "Essential PragmataPro-10" -nb "#402E2E" -nf "#C0B18B" -sb "#4A3637" -sf "#7B8748" -b -i
bindsym $mod+space exec --no-startup-id rofi -show run
bindsym $mod+Tab exec --no-startup-id rofi -show window

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+d floating toggle

# change focus between tiling / floating windows
bindsym $mod+d focus mode_toggle

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# border changing
bindsym $mod+b border toggle

# scratchpad
bindsym $mod+m move scratchpad
bindsym $mod+o scratchpad show

# toggle touchpad (not in dotfiles repo)
bindsym $mod+p exec --no-startup-id ~/bin/touchpad-toggle

# move to last workspace
bindsym $mod+z workspace back_and_forth

# jump to previous workspace by hitting first ws button again
#workspace_auto_back_and_forth yes

# move windows back and forth
bindsym $mod+Shift+z move container to workspace back_and_forth

bindsym $mod+Control+Shift+Prior move container to output left
bindsym $mod+Control+Shift+Next move container to output right

bindsym $mod+a focus parent
bindsym $mod+Shift+a focus child

# screenshot
bindsym --release Print exec scrot $HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png
bindsym --release Shift+Print exec scrot -s $HOME/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png

# send a signal to i3blocks on caps
bindsym --release Caps_Lock exec pkill -SIGRTMIN+11 i3blocks

# ────────────── Resize menu ──────────────
mode "resize" {
  # vi movement
  bindsym j resize shrink width 10 px or 10 ppt
  bindsym k resize grow height 10 px or 10 ppt
  bindsym l resize shrink height 10 px or 10 ppt
  bindsym semicolon resize grow width 10 px or 10 ppt

  # same bindings, but for the arrow keys
  bindsym Left resize shrink width 10 px or 10 ppt
  bindsym Down resize grow height 10 px or 10 ppt
  bindsym Up resize shrink height 10 px or 10 ppt
  bindsym Right resize grow width 10 px or 10 ppt

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

# ────────────── Autostart ──────────────
exec firefox
exec --no-startup-id urxvtc

# ───────────── System Menu ─────────────
# https://wiki.archlinux.org/index.php/I3#Shutdown.2C_reboot.2C_lock_screen
set $Locker i3lock --image=/usr/share/backgrounds/pattern-01.png -t && sleep 1

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

# ───────────── output menu ─────────────
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

# vim:filetype=i3
