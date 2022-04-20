primary_monitor   = "DP-1"
secondary_monitor = "DVI-I-1"
tertiary_monitor  = "HDMI-0"
dpi = 192
resolution_height = 2160
resolution_width = 3840
bar_height = 34
rofi_width = $$(( $(resolution_width) * 20/100 ))
rofi_height = $$(( $(resolution_height) - $(bar_height) ))
font = "Iosevka 24px"
dunst_width = (0, 300)
dunst_height = 600
dunst_offset = 0x$(bar_height)
