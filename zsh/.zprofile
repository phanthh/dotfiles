umask 027

#====================== session

if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
  red=`tput setaf 1`
  blue=`tput setaf 4`
  green=`tput setaf 6`
  reset=`tput sgr0`
  echo "\n${red}Starting:${reset}"
  echo "\n${green}$(echo -e "import art\nart.tprint('$SESSION',font='sblood')" | python)${reset}"

  if [[ ! -z $SESSION && $SESSION != shell ]]; then
    case $SESSION in
      sway)
        XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway QT_QPA_PLATFORMTHEME=qt5ct sway --unsupported-gpu
        ;;
      labwc)
        XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=labwc QT_QPA_PLATFORMTHEME=qt5ct labwc
        ;;
      gnome)
        XDG_SESSION_TYPE=wayland dbus-run-session gnome-session
        ;;
      plasma)
        XDG_SESSION_TYPE=wayland startplasma-wayland
        ;;
      *)
        XDG_SESSION_TYPE=shell $SHELL
        ;;
    esac
    $HOME/.sh/wm_cleanup
    /usr/bin/rm -rf $XDG_CACHE_HOME/*
    if [[ $SESSION_HOLD == 0 ]]; then
      logout
    fi
  fi
fi
