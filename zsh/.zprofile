if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then 
		# brave browser option
		XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
		USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf"
		DIS_USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf.dis"

		case $WM in 
			i3)
				# PRIME switch
				sudo /usr/bin/prime-switch
				# switch brave flags
				if [[ -f $USER_FLAGS_FILE ]]; then
					mv $USER_FLAGS_FILE $DIS_USER_FLAGS_FILE
				fi
				# XServer -> I3
				exec startx &> /dev/null
				;;
			sway)
				# switch brave flags
				if [[ -f $DIS_USER_FLAGS_FILE ]]; then
					mv $DIS_USER_FLAGS_FILE $USER_FLAGS_FILE
				fi
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


