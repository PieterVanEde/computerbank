#!/bin/bash

# Set variables
skeletonPath='/etc/skel/Desktop/'
skeletonConfigPath="/etc/skel/.config/"
regularAppsDir='/usr/share/applications'
flatpakAppsDir='/var/lib/flatpak/exports/share/applications'
snapAppsDir='/var/lib/snapd/desktop/applications'
xfceDesktopIconFile='~/.config/xfce4/desktop/icons.screen.latest.rc'

# Create shortcuts (launchers) to applications

sudo mkdir -p $skeletonPath

### Browsers
sudo cp $regularAppsDir/firefox.desktop $skeletonPath
sudo cp $regularAppsDir/google-chrome.desktop $skeletonPath
sudo cp $regularAppsDir/microsoft-edge.desktop $skeletonPath

### Mail
sudo cp $regularAppsDir/thunderbird.desktop $skeletonPath
sudo cp -L $snapAppsDir/bluemail_bluemail.desktop $skeletonPath

#### Chat
sudo cp -L $flatpakAppsDir/com.ktechpit.whatsie.desktop $skeletonPath
sudo cp -L $flatpakAppsDir/org.telegram.desktop.desktop $skeletonPath
sudo cp -L $flatpakAppsDir/com.github.IsmaelMartinez.teams_for_linux.desktop $skeletonPath
sudo cp $regularAppsDir/Zoom.desktop $skeletonPath
sudo cp $regularAppsDir/discord.desktop $skeletonPath

#### Office
sudo cp $regularAppsDir/libreoffice-startcenter.desktop $skeletonPath
sudo cp $regularAppsDir/libreoffice-writer.desktop $skeletonPath
sudo cp $regularAppsDir/libreoffice-calc.desktop $skeletonPath
sudo cp $regularAppsDir/libreoffice-impress.desktop $skeletonPath
sudo cp $regularAppsDir/libreoffice-draw.desktop $skeletonPath

# Other important shortcuts
sudo cp $regularAppsDir/dropbox.desktop $skeletonPath
sudo cp $regularAppsDir/spotify.desktop $skeletonPath
sudo cp $regularAppsDir/steam.desktop $skeletonPath

sudo cp $regularAppsDir/mintinstall.desktop $skeletonPath

# Prepare script that adjusts icon positions on first start
sudo cp -r ./.config/* $skeletonConfigPath