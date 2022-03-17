umask 027

#====================== session
if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty && ! -z $SESSION ]]; then
  echo "Starting $SESSION session..."
  echo -e "\nimport art\nart.tprint('$SESSION',font='sblood')" | python
  case $SESSION in
    sway)
      XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway QT_QPA_PLATFORMTHEME=qt5ct sway --unsupported-gpu
      $XDG_CONFIG_HOME/sway/cleanup
      ;;
    labwc)
      XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=labwc QT_QPA_PLATFORMTHEME=qt5ct labwc
      $XDG_CONFIG_HOME/sway/cleanup
      ;;
    gnome)
      XDG_SESSION_TYPE=wayland dbus-run-session gnome-session
      ;;
    plasma)
      XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=plasma startplasma-wayland
      ;;
    shell)
      XDG_SESSION_TYPE=shell $SHELL
      ;;
    *)
      echo "Session $SESSION is invalid !"
      ;;
  esac
  /usr/bin/rm -rf $XDG_CACHE_HOME/*
	logout
	exit
fi
