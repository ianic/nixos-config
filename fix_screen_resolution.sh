#!/bin/sh

if ! xrandr --current | grep "Screen 0" | grep "current 6720" > /dev/null; then
   xrandr -s 6720x3732
fi
