#!/bin/sh

# Input
xset r rate 255 100 &
xset m mouse 3/2 10 &
xset s on &
xset s 600 &
xrdb /home/phanth/.Xresources &
# setxkbmap -option caps:escape &

# PRIME offload
/usr/bin/prime-offload &

exec $XDG_CURRENT_DESKTOP
