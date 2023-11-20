#!/bin/sh

# Overrite /etc/apt/sources.list with below lines
# Enable contrib and non-free sources
echo "# contrib and non-free sources
deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware 
deb-src http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware

deb http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware" > /etc/apt/sources.list

# Enable bookworm backports
printf "\n# bookworm-backports
deb http://deb.debian.org/debian bookworm-backports main contrib non-free
deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free" >> /etc/apt/sources.list

# Refresh local packages
sudo apt update

# Refresh repos and install git, curl, vlc, ubuntu-restricted-extras and build-essential
sudo apt install fish htop neovim neofetch git curl gnome-clocks vlc haruna elisa ktorrent skanlite timeshift flatpak build-essential python3-pip python3-tk sqlite3 p7zip p7zip-full obs-studio gimp chromium libavcodec-extra ttf-mscorefonts-installer unrar gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y # Enter 'y' to download

# Remove default apps
sudo apt remove dragonplayer juk -y

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

# Remove power demon to avoid any conflict with tlp and install tlp
# sudo apt remove power-profiles-daemon -y && sudo apt install tlp tlp-rdw -y

# Install software from deb-get
sudo deb-get install brave-browser code spotify-client bitwarden zoom blanket teamviewer virtualbox-7.0 onlyoffice-desktopeditors discord

# Add flatpak repository
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install flatpak apps
flatpak install flathub flatseal io.gitlab.idevecore.Pomodoro joplin postman -y

# Install JetbrainsMono NerdFont
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# # Update font cache
fc-cache -vf

# # Install MongoDB 7 in ubuntu 22.04
# # Install gnupg if it is not already available
# sudo apt install gnupg -y
# # Import MongoDb public GPG key
# curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
#    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
#    --dearmor
# # Create a list file
# echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
# # Reload local packages
# sudo apt update
# # Install latest stable version
# sudo apt install mongodb-org -y  
# # Start the mongod process 
# sudo systemctl start mongod
# # Start MongoDB following a system reboot
# sudo systemctl enable mongod
# # Show if the MongoDB has started 
# # sudo systemctl status mongod

# Generate github ssh key
BASEDIR=$(cd $(dirname $0) && pwd)
$BASEDIR/generate_new_github_ssh_key.sh

# Add custom commands to .bashrc file  
cd ~
printf "\n# Custom commands\n# command to create github repos\nalias create='~/Development/shell-scripts/automate_repo.sh'\n# command to wish facebook birthdays\nalias wish='~/Development/shell-scripts/fb_birthday_wisher.sh'" >> .bashrc