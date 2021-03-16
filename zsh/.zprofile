#================ START XSERVER ON LOGIN =======================#
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then 
    sudo /usr/bin/prime-switch
    exec startx &> /dev/null
logout
fi


