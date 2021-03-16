#! /bin/sh
if [[ $(xinput list ETPS/2\ Elantech\ Touchpad | grep -Ec "disabled") -eq 1 ]]; then
	xinput enable ETPS/2\ Elantech\ Touchpad
else
	xinput disable ETPS/2\ Elantech\ Touchpad
fi
