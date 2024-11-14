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

arrangeAutostarter="~/.config/autostart/arrange.desktop"
while [ -f $arrangeAutostarter ]
do
	rm -f $arrangeAutostarter
	echo "pieter" >> autoStartDeleter
	sleep 5
	
done




