#!/bin/bash

# Run this script in the OEM phase of the OEM installation procedure of Linux Mint

# Don't forget to check for non-free drivers manually

# General update
sudo apt update
sudo apt upgrade -y

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

# BlueMail (needs snap activation)
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install snapd
sudo snap install bluemail

#### Chat clients

# Telegram
flatpak install flathub org.telegram.desktop -y

# WhatsApp
flatpak install flathub com.ktechpit.whatsie -y

# Teams
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux  -y

# Zoom
wget https://zoom.us/client/6.2.6.2503/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb -y

# Discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb #TODO error

#### Online file storage

# TODO do not appear at the moment

# Dropbox
sudo apt install python3-gpg -y # Needed to avoid warning about missing packages on first launch
wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2024.04.17_amd64.deb
sudo apt install ./dropbox.deb -y

# Google Drive (TODO currently no Windows-like alternative found)
 
# Microsoft OneDrive (see https://github.com/abraunegg/onedrive/blob/master/docs/ubuntu-package-install.md)
# -> First cleanup any references to obsolete onedrive package
#sudo apt remove onedrive
#sudo add-apt-repository --remove ppa:yann1ck/onedrive
#sudo rm /etc/systemd/user/default.target.wants/onedrive.service
# -> Then install Onedrive from correct source
#wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list
#sudo apt-get update
#sudo apt install --no-install-recommends --no-install-suggests onedrive -y

# iCloud (not found a viable solution so far, maybe just include link to their website?)

### Media

# VLC
sudo apt install vlc -y

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

#### Games

sudo apt install steam kapman granatier kbounce kbreakout ksnakeduel knights kfourinline kigo kpat gcompris-qt ktuberling -y

# Misc packages
sudo apt install gnucash -y

#### Enable automatic updates
sudo mintupdate-automation upgrade enable
sudo mintupdate-automation autoremove enable
# TODO flatpak and snap

# General update (again)
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

##### Prepare desktop icon arrangement on first start
#sudo cp ./user-first-login.sh /etc/profile.d
#sudo chmod +x /etc/profile.d/user-first-login.sh

./prepare-skeleton.sh