if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then 
		# KEYRING
		eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) &
		export SSH_AUTH_SOCK &

		case $WM in 
			i3)
				# PRIME switch
				sudo /usr/bin/prime-switch
				# XServer -> I3
				exec startx &> /dev/null
				;;
			sway)
				export _JAVA_AWT_WM_NONREPARENTING=1
				export MOZ_ENABLE_WAYLAND=1
				export QT_QPA_PLATFORM=wayland
				export CLUTTER_BACKEND=wayland
				exec sway &> /dev/null
				;;
			*)
				echo "No valid DE/WM specified"
				;;
		esac 
		logout
fi


