if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then 
		echo "Starting $XDG_CURRENT_DESKTOP..."
		# brave browser option
		XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
		USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf"
		DIS_USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf.dis"

		case $XDG_CURRENT_DESKTOP in 
			i3)
				if [[ -f $USER_FLAGS_FILE ]]; then
					mv $USER_FLAGS_FILE $DIS_USER_FLAGS_FILE
				fi

				# PRIME switch
				sudo /usr/bin/prime-switch

				export QT_QPA_PLATFORMTHEME=qt5ct
				export GTK_IM_MODULE=ibus
				export XMODIFIERS=@im=ibus
				export QT_IM_MODULE=ibus
				export MOZ_X11_EGL=1

				exec startx &> /dev/null
				;;
			sway)
				if [[ -f $DIS_USER_FLAGS_FILE ]]; then
					mv $DIS_USER_FLAGS_FILE $USER_FLAGS_FILE
				fi

				export QT_QPA_PLATFORMTHEME=qt5ct
				export GTK_IM_MODULE=fcitx
				export XMODIFIERS=@im=fcitx
				export QT_IM_MODULE=fcitx
				export _JAVA_AWT_WM_NONREPARENTING=1
				export MOZ_DISABLE_RDD_SANDBOX=1
				export MOZ_ENABLE_WAYLAND=1
				export QT_QPA_PLATFORM=wayland
				export CLUTTER_BACKEND=wayland

				exec sway &> /dev/null

				;;
			plasma)
				if [[ -f $DIS_USER_FLAGS_FILE ]]; then
					mv $DIS_USER_FLAGS_FILE $USER_FLAGS_FILE
				fi

				export GTK_IM_MODULE=fcitx
				export XMODIFIERS=@im=fcitx
				export QT_IM_MODULE=fcitx
				export _JAVA_AWT_WM_NONREPARENTING=1
				export MOZ_DISABLE_RDD_SANDBOX=1
				export MOZ_ENABLE_WAYLAND=1
				export QT_QPA_PLATFORM="xcb;wayland"
				export XDG_SESSION_TYPE=wayland

				exec dbus-run-session startplasma-wayland 

				;;
			*)
				echo "No valid desktop specified"
				;;
		esac 
	  # logout
fi


