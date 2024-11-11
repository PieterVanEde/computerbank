#!/bin/bash
# This script is executed at the end of adduser
# USAGE:
# adduser.local USER UID GID HOME

iconsFile=$(readlink ~/.config/xfce4/desktop/icons.screen.latest.rc)

while [ -z "${iconsFile}" ]
do
	sleep 5
	iconsFile=$(readlink ~/.config/xfce4/desktop/icons.screen.latest.rc)
done

rm $iconsFile
cat ~/.config/computerbank/icons.screen.rc > $iconsFile
perl -i -0pe "s@\~@$HOME@mg" $iconsFile

xfdesktop --quit
sleep 10
xfdesktop

rm -f ~/.config/autostart/arrange.desktop


