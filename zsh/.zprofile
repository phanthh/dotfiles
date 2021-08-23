if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then 
		echo "Starting $XDG_CURRENT_DESKTOP..."
		# brave browser option

		case $XDG_CURRENT_DESKTOP in 
			i3)
				mv $XDG_CONFIG_HOME/brave-flags.conf $XDG_CONFIG_HOME/brave-flags.conf.dis &> /dev/null
				mv $XDG_CONFIG_HOME/chromium-flags.conf $XDG_CONFIG_HOME/chromium-flags.conf.dis &> /dev/null

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
				mv $XDG_CONFIG_HOME/brave-flags.conf.dis $XDG_CONFIG_HOME/brave-flags.conf &> /dev/null
				mv $XDG_CONFIG_HOME/chromium-flags.conf.dis $XDG_CONFIG_HOME/chromium-flags.conf &> /dev/null

				export QT_QPA_PLATFORMTHEME=qt5ct
				export _JAVA_AWT_WM_NONREPARENTING=1
				export MOZ_DISABLE_RDD_SANDBOX=1
				export MOZ_ENABLE_WAYLAND=1
				export QT_QPA_PLATFORM=wayland
				export CLUTTER_BACKEND=wayland
				export GTK_IM_MODULE=fcitx
				export XMODIFIERS=@im=fcitx
				export QT_IM_MODULE=fcitx

				exec sway &> /dev/null

				;;
			gnome)
				mv $XDG_CONFIG_HOME/brave-flags.conf.dis $XDG_CONFIG_HOME/brave-flags.conf &> /dev/null
				mv $XDG_CONFIG_HOME/chromium-flags.conf.dis $XDG_CONFIG_HOME/chromium-flags.conf &> /dev/null

				export QT_QPA_PLATFORMTHEME=qt5ct
				export _JAVA_AWT_WM_NONREPARENTING=1
				export MOZ_DISABLE_RDD_SANDBOX=1
				export MOZ_ENABLE_WAYLAND=1
				export QT_QPA_PLATFORM=wayland
				export CLUTTER_BACKEND=wayland
				export XDG_SESSION_TYPE=wayland

				exec gnome-shell --wayland &> /dev/null
				;;
			*)
				echo "No valid desktop specified"
				;;
		esac 
	  logout
fi

