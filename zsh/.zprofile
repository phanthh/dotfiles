umask 027

#====================== session 
if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty && ! -z $SESSION ]]; then
  echo "Starting $SESSION session..."
  echo -e "import art\nart.tprint('$SESSION',font='sblood')" | python
  case $SESSION in
    sway) XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway exec sway --unsupported-gpu ;;
    gnome) XDG_SESSION_TYPE=wayland dbus-run-session gnome-session ;;
    shell) XDG_SESSION_TYPE=shell exec $SHELL ;;
    *) echo "Session $SESSION is invalid !" ;;
  esac 
	logout
	exit
fi

