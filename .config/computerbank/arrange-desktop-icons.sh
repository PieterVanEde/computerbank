#!/bin/bash
# This script is executed at the end of adduser
# USAGE:
# adduser.local USER UID GID HOME

if [ -f ~/.config/computerbank/firstlogin ]
then
	iconsFile=$(readlink ~/.config/xfce4/desktop/icons.screen.latest.rc)
	rm $iconsFile
	cat ~/.config/computerbank/icons.screen.rc > $iconsFile
	perl -i -0pe "s@\~@$HOME@mg" $iconsFile
	
	xfdesktop --quit
	sleep 10
	xfdesktop
	
	rm -f ~/.config/computerbank/firstlogin
fi


