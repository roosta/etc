# --------------------
# WORKSPACES
# -------------------- 

bindsym $mod+q workspace $pws_term
bindsym $mod+w workspace $pws_edit
bindsym $mod+e workspace $pws_www
bindsym $mod+1 workspace $pws_media
bindsym $mod+2 workspace $pws_game
bindsym $mod+3 workspace $pws_gfx
bindsym $mod+4 workspace $pws_chat

bindsym $mod+Shift+q move workspace $pws_term
bindsym $mod+Shift+w move workspace $pws_edit
bindsym $mod+Shift+e move workspace $pws_www
bindsym $mod+Shift+1 move workspace $pws_media
bindsym $mod+Shift+2 move workspace $pws_game
bindsym $mod+Shift+3 move workspace $pws_gfx
bindsym $mod+Shift+4 move workspace $pws_chat

bindsym $mod+a workspace $sws_a
bindsym $mod+s workspace $sws_s
bindsym $mod+d workspace $sws_debug
bindsym $mod+Shift+a move workspace $sws_a
bindsym $mod+Shift+s move workspace $sws_s
bindsym $mod+Shift+d move workspace $sws_debug

bindsym $mod+F1  workspace $tws_stats
bindsym $mod+F2  workspace $tws_media
bindsym $mod+F3  workspace $tws_download
bindsym $mod+Shift+F1  move workspace $tws_stats
bindsym $mod+Shift+F2  move workspace $tws_media
bindsym $mod+Shift+F3  move workspace $tws_download

bindsym $mod+5 workspace $aws_5
bindsym $mod+6 workspace $aws_6
bindsym $mod+7 workspace $aws_7
bindsym $mod+8 workspace $aws_8
bindsym $mod+9 workspace $aws_9
bindsym $mod+0 workspace $aws_0
bindsym $mod+F4  workspace $aws_f4
bindsym $mod+F5  workspace $aws_f5
bindsym $mod+F6  workspace $aws_f6
bindsym $mod+F7  workspace $aws_f7
bindsym $mod+F8  workspace $aws_f8
bindsym $mod+F9  workspace $aws_f9
bindsym $mod+F10 workspace $aws_f10
bindsym $mod+F11 workspace $aws_f11
bindsym $mod+F12 workspace $aws_f12

bindsym $mod+shift+5  move workspace $aws_5
bindsym $mod+shift+6  move workspace $aws_6
bindsym $mod+shift+7  move workspace $aws_7
bindsym $mod+shift+8  move workspace $aws_8
bindsym $mod+shift+9  move workspace $aws_9
bindsym $mod+Shift+0  move workspace $aws_0
bindsym $mod+shift+f4  move workspace $aws_f4
bindsym $mod+shift+f5  move workspace $aws_f5
bindsym $mod+shift+f6  move workspace $aws_f6
bindsym $mod+shift+f7  move workspace $aws_f7
bindsym $mod+shift+f8  move workspace $aws_f8
bindsym $mod+Shift+F9  move workspace $aws_f9
bindsym $mod+Shift+F10 move workspace $aws_f10
bindsym $mod+Shift+F11 move workspace $aws_f11
bindsym $mod+Shift+F12 move workspace $aws_f12

## assign workspaces to outputs
# primary
workspace $pws_term output $primary_monitor
workspace $pws_edit output $primary_monitor
workspace $pws_www output $primary_monitor
workspace $pws_media output $primary_monitor
workspace $pws_game output $primary_monitor
workspace $pws_gfx output $primary_monitor
workspace $pws_chat output $primary_monitor

# secondary
workspace $sws_a output $secondary_monitor
workspace $sws_s output $secondary_monitor
workspace $sws_debug output $secondary_monitor

# tertiary
workspace $tws_stats output $tertiary_monitor
workspace $tws_media output $tertiary_monitor
workspace $tws_download output $tertiary_monitor

# Options
focus_follows_mouse no
new_window pixel 1
hide_edge_borders none

# WINDOW WORKSPACE ASSIGNMENT
# ---------------------------
# W:DEV
assign [class="(?i)google-chrome-beta"]     $sws_debug
assign [class="(?i)google-chrome-unstable"] $sws_debug
# assign [instance="^Devtools$$"]             $sws_s
# assign [class="(?i)firefox-developer"]      $sws_s
assign [class="(?i)subl3"]                  $pws_edit
assign [class="(?i)jetbrains-idea"]         $pws_edit
assign [class="(?i)atom"]                   $pws_edit
assign [class="(?i)emacs"]                  $pws_edit

# E:WWW
assign [class="(?i)firefox"] $pws_www

# 2:GAM
assign [class="(?i)^steam(.*)"]   $pws_game
assign [class="(?i)Wine"]        $pws_game
assign [class="(?i)PlayOnLinux"] $pws_game
#assign [title="(?i)friends"] $TWS2

# 1:MED
# workaround for spotify WS assignment
# see: https://github.com/i3/i3/issues/2060
for_window [class="Spotify"] move to workspace $pws_media

# assign [class="(?i)google-chrome"] $TWS1
assign [class="(?i)smplayer"]   $pws_media
assign [class="(?i)clementine"] $pws_media

# 3:ART
assign [class="(?i)inkscape"] $pws_gfx
assign [class="(?i)gimp"]     $pws_gfx
assign [class="(?i)krita"]    $pws_gfx
assign [class="(?i)freecad"]  $pws_gfx

# S:COM
assign [class="(?i)pidgin"]      $pws_chat
assign [class="(?i)linphone"]    $pws_chat
assign [class="(?i)skype"]       $pws_chat
assign [class="(?i)slack"]       $pws_chat
assign [class="(?i)franz"]       $pws_chat
# assign [class="(?i)thunderbird"] $FWS2

assign [class="(?i)conky"] $tws_stats
assign [class="(?i)transmission-gtk"] $tws_download

# WINDOW BEHAVIOUR
# ----------------
# create some rules to force floating on certain roles/classes
for_window [window_role="pop-up"] floating enable
for_window [title="teamviewer"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [window_role="bubble"] floating enable
for_window [title="Preferences$"] floating enable
for_window [window_role="Preferences"] floating enable
for_window [title="Preferences$"] floating enable

# application spesific
for_window [class="(?i)Jitsi"] floating enable
for_window [class="(?i)SessionManager"] floating enable
for_window [class="(?i)Linphone"] floating enable
for_window [title="(?i)Friends"] floating enable
#for_window [title="(?i)Steam#-#Update#News(.*)"] floating enable
for_window [class="(?i)Pidgin"] floating enable
for_window [class="(?i)nitrogen"] floating enable
for_window [class="(?i)pinentry-gtk-2"] floating enable
for_window [class="(?i)yad"] floating enable

## WINDOW SIZE
## -----------
for_window [class="(?i)Pidgin"] floating_maximum_size 50 x 75
for_window [class="(?i)nitrogen"] floating_maximum_size 768 x 2160
for_window [id="Open Document"] floating_maximum_size 670 x 470
for_window [window_role="task_dialog"] floating_maximum_size 670 x 470

# BORDER
# ------
#for_window [class="(?i)firefox"]               border none
#for_window [class="(?i)google-chrome$"]         border none
for_window [class="(?i)PrisonArchitect.x86_64"] border none
for_window [class="(?i)conky"] border none

## KEYBINDINGS
## -----------
# set modkey (Super key)
set $mod Mod4

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

bindsym $mod+Return exec $term

bindsym $mod+Shift+Return exec firefox
#bindsym $mod+Shift+Return exec $tmux_new

# kill focused window
bindsym $mod+c kill

set $combi_modi "window;DRun"
# bindsym $mod+Tab exec --no-startup-id rofi -show DRun
bindsym $mod+Tab exec --no-startup-id "rofi -show combi -combi-modi \\"window,DRun\\"
# bindsym $mod+Tab exec --no-startup-id rofi -show 
bindsym $mod+grave exec --no-startup-id rofi -show window

# focus vi bindings
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# focus cursor key bindings
bindsym $mod+Left  focus left
bindsym $mod+Down  focus down
bindsym $mod+Up    focus up
bindsym $mod+Right focus right

bindsym $mod+Shift+Left  move left
bindsym $mod+Shift+Down  move down
bindsym $mod+Shift+Up    move up
bindsym $mod+Shift+Right move right

# choose split direction.
bindsym $mod+v split h
bindsym $mod+x split v

# window layout controls
bindsym $mod+Control+Shift+t layout stacked
bindsym $mod+Shift+t layout toggle
bindsym $mod+t layout tabbed
bindsym $mod+f fullscreen toggle

# toggle
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# regenerate configuration from template and restart i3
bindsym $mod+Control+Shift+r exec --no-startup-id $fullrestart

# reload i3 configuration
bindsym $mod+Shift+c reload

# regenerate i3 config and reload
bindsym $mod+Control+Shift+c exec --no-startup-id $fullreload

# border changing
bindsym $mod+b border toggle

# scratchpad
bindsym $mod+m move scratchpad
bindsym $mod+o scratchpad show

# toggle touchpad
bindsym XF86TouchpadToggle exec --no-startup-id ~/bin/touchpad_toggle

# move to last workspace
bindsym $mod+z workspace back_and_forth

# move windows back and forth
bindsym $mod+Shift+z move container to workspace back_and_forth

bindsym $mod+Control+Shift+left move container to output left
bindsym $mod+Control+Shift+right move container to output right

bindsym $mod+p focus parent
bindsym $mod+Shift+p focus child

# screenshot
# source: https://github.com/Airblader/dotfiles-manjaro
bindsym --release Print exec scrot $screenshot
bindsym --release Shift+Print exec scrot -s $screenshot

# send a signal to i3status on caps to toggle layout
# bindsym --release Caps_Lock exec pkill -SIGRTMIN+11 i3blocks
# bindsym --release Caps_Lock exec killall -USR1 py3status

## BINDING MODES
## -------------

# RESIZE
# resize windows with either vi keys or arrows.
# shift+movement shrink or grow with larger increments
set $mode_resize Resize: direction + (shift|control|shift&control)
mode "$mode_resize" {
  # vi movement
  bindsym h resize shrink width  50 px or 50 ppt
  bindsym j resize grow   height 50 px or 50 ppt
  bindsym k resize shrink height 50 px or 50 ppt
  bindsym l resize grow   width  50 px or 50 ppt

  bindsym Shift+h resize shrink width  100 px or 100 ppt
  bindsym Shift+j resize grow   height 100 px or 100 ppt
  bindsym Shift+k resize shrink height 100 px or 100 ppt
  bindsym Shift+l resize grow   width  100 px or 100 ppt

  bindsym Control+h resize shrink width  200 px or 200 ppt
  bindsym Control+j resize grow   height 200 px or 200 ppt
  bindsym Control+k resize shrink height 200 px or 200 ppt
  bindsym Control+l resize grow   width  200 px or 200 ppt

  bindsym Shift+Control+h resize shrink width  300 px or 300 ppt
  bindsym Shift+Control+j resize grow   height 300 px or 300 ppt
  bindsym Shift+Control+k resize shrink height 300 px or 300 ppt
  bindsym Shift+Control+l resize grow   width  300 px or 300 ppt

  # assign the same for arrows
  bindsym Left  resize shrink width  50 px or 50 ppt
  bindsym Down  resize grow   height 50 px or 50 ppt
  bindsym Up    resize shrink height 50 px or 50 ppt
  bindsym Right resize grow   width  50 px or 50 ppt

  bindsym Shift+Left  resize shrink width  100 px or 100 ppt
  bindsym Shift+Down  resize grow   height 100 px or 100 ppt
  bindsym Shift+Up    resize shrink height 100 px or 100 ppt
  bindsym Shift+Right resize grow   width  100 px or 100 ppt

  bindsym Control+Left  resize shrink width  200 px or 200 ppt
  bindsym Control+Down  resize grow   height 200 px or 200 ppt
  bindsym Control+Up    resize shrink height 200 px or 200 ppt
  bindsym Control+Right resize grow   width  200 px or 200 ppt

  bindsym Shift+Control+Left  resize shrink width  300 px or 300 ppt
  bindsym Shift+Control+Down  resize grow   height 300 px or 300 ppt
  bindsym Shift+Control+Up    resize shrink height 300 px or 300 ppt
  bindsym Shift+Control+Right resize grow   width  300 px or 300 ppt

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}
bindsym $mod+r mode "$mode_resize"

# SYSTEM
# https://wiki.archlinux.org/index.php/I3#Shutdown.2C_reboot.2C_lock_screen
set $mode_system System: (l) lock, (e) logout, (s) suspend, (r) reboot, (Shift+s) shutdown
mode "$mode_system" {
  bindsym l       exec --no-startup-id $locker, mode "default"
  bindsym e       exec --no-startup-id i3-msg exit, mode "default"
  bindsym s       exec --no-startup-id $locker && systemctl suspend, mode "default"
  bindsym r       exec --no-startup-id systemctl reboot, mode "default"
  bindsym Shift+s exec --no-startup-id systemctl poweroff -i, mode "default"

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}
# bind FN sleep key to menu
bindsym XF86Sleep mode "$mode_system"
bindsym $mod+End mode "$mode_system"

# OUTPUT
# Quickly switch output based on presets
# Script is in the submodule "scripts". Alternativly http://github.com/roosta/scripts
set $changeto ~/bin/chdisp
set $mode_chdisp Layout: (d) desk, (t) TV, (a) all
mode "$mode_chdisp" {
  bindsym d exec --no-startup-id $changeto desk, mode "default"
  bindsym t exec --no-startup-id $changeto tv, mode "default"
  bindsym a exec --no-startup-id $changeto all, mode "default"

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}
# bind FN home key to menu
bindsym XF86HomePage mode "$mode_chdisp"
bindsym $mod+Home mode "$mode_chdisp"

## APPEARANCE
## ----------
# generated from template
# set primary font
font pango:Essential PragmataPro 9

# <class>               <border>      <background>  <foreground> <indicator>
client.focused          $magenta      $magenta      $white       $cyan
client.focused_inactive $bright_black $white        $black       $cyan
client.unfocused        $bright_black $bright_black $gray        $cyan
client.urgent           $orange       $orange       $black       $cyan
client.placeholder      $magenta      $cyan         $black       $cyan

