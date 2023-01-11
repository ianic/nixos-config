#!/bin/sh

# keyboard repeat rate [delay [rate]]
xset r rate 400 40

# screen resoulution
xrandr -s 6720x3732

# fix apple keyboard ~ key
# xkbcomp ~/nixos-config/users/ianic/layout.xkb $DISPLAY
