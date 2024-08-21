#!/bin/sh

dwmstatus 2>&1 >/dev/null & 

xmodmap -e "keycode 108 = Super_L"
xmodmap -e "remove mod1 = Super_L"

exec dwm
