#!/bin/sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Lock daemon
xss-lock --transfer-sleep-lock -- slock &

xset r rate 255 100 &
xset m mouse 3/2 10 &
xset s on &
xset s 600 &

numlockx &
# setxkbmap -option caps:escape &
/usr/bin/prime-offload &

# DE / WM
# startxfce4
i3
