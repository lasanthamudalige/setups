#!/bin/sh

# Start redshift
redshift -l 7.24:80.26 &

# DWM status bar
dwmstatus 2>&1 >/dev/null & 

# Assign right alt as second super
xmodmap -e "keycode 108 = Super_L"
xmodmap -e "remove mod1 = Super_L"

exec dwm
