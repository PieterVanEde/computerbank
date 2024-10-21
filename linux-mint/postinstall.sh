#!/bin/sh

# Run this script in the OEM phase of the OEM installation procedure of Linux Mint

# Turned out problematic:

sudo apt update
sudo apt upgrade 

# Install system packages
sudo apt install vlc steam gnucash 

#### Browsers

# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo apt update
sudo apt install google-chrome-stable  

# Install Microsoft Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo apt update
sudo apt install microsoft-edge-stable 

#### Mail clients

# BlueMail
wget https://download.bluemail.me/BlueMail/deb/BlueMail.deb
sudo apt install ./BlueMail.deb  

#### Chat clients

sudo apt install telegram-desktop  

# WhatsApp
flatpak install flathub com.ktechpit.whatsie

# Teams
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux

# Zoom
flatpak install flathub us.zoom.Zoom

# Discord
flatpak install flathub com.discordapp.Discord

#### Online file storage

# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# Google Drive
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse  
 
# Microsoft OneDrive
wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list
sudo apt-get update
sudo apt install onedrive  

# iCloud (not found a viable solution so far, maybe just include link to their website?)

#### Games

sudo apt install steam   

flatpak install flathub org.kde.kapman
flatpak install flathub org.kde.granatier
flatpak install flathub org.kde.kbounce
flatpak install flathub org.kde.kbreakout
flatpak install flathub org.kde.ksnakeduel
flatpak install flathub org.kde.knights
flatpak install flathub org.kde.kfourinline
flatpak install flathub org.kde.kigo
flatpak install flathub org.kde.kpat
flatpak install flathub org.kde.gcompris
flatpak install flathub org.kde.ktuberling

