pkill -f 'ibus' &
pkill -f 'foot' &
pkill -f 'swhks' &
pkill -f 'kanshi' &
pkill -f 'dunst' &
pkill -f 'sworkstyle' &
pkill -f 'gammastep' &
pkill -f 'wluma' &
pkill -f "tail -f $WOBSOCK" &
pkill -f 'clight' &
# activitywatch
# pkill -f 'aw-watcher' &
# pkill -f 'aw-qt' &
# pkill -f 'aw-server' &
# pkill -f 'aw-server' &
# pkill -f 'aw-watcher-window-wayland' &
# pkill -f 'aw-watcher-spotify' &
/usr/bin/rm -rf $XDG_CACHE_HOME/*
