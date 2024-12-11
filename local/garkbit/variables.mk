primary_monitor   = "DisplayPort-2"
secondary_monitor = "DisplayPort-0"
tertiary_monitor  = "DisplayPort-1"
quaternary_monitor = "HDMI-A-0"
dpi = 192
resolution_height = 2160
resolution_width = 3840
bar_height = 34
rofi_width = $$(( $(resolution_width) * 20/100 ))
rofi_height = $$(( $(resolution_height) - $(bar_height) ))
font = "Iosevka 24px"
dunst_width = (0, 300)
dunst_offset = (0, $$(( $(bar_height) / 2 )))
