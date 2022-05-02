umask 027

#====================== session
[[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]] && {
  red=`tput setaf 1`
  green=`tput setaf 6`
  blue=`tput setaf 4`
  reset=`tput sgr0`

  echo "\n${red}Starting:${reset}"
  echo "\n${green}$(echo -e "import art\nart.tprint('$SESSION',font='sblood')" | python)${reset}"

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
    *|shell)
      export SESSION_HOLD=1
      export XDG_SESSION_TYPE=tty
      ;;
  esac

  [[ $SESSION_HOLD == 0 ]] && logout
}
