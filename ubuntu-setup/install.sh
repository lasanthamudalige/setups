# Refresh repos and install git, curl, vlc, ubuntu-restricted-extras and build-essential
sudo apt install ubuntu-restricted-extras fish htop neofetch git curl gnome-clocks gnome-dictionary vlc build-essential python3-pip python3-tk sqlite3 p7zip-full p7zip-rar zanshin -y # Enter 'y' to download

# Install snap version for wayland and apt for xorg
# sudo apt install obs-studio
sudo snap install obs-studio 
sudo snap install postman

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

# # Remove firefox snap
# # Remove snap version
# sudo snap disable firefox 
# sudo umount /var/snap/firefox/common/host-hunspell
# sudo snap remove --purge firefox
# # Add firefox ppa
# sudo add-apt-repository ppa:mozillateam/ppa -y
# # Change prefrence to firefox ppa from snap
# echo '
# Package: *
# Pin: release o=LP-PPA-mozillateam
# Pin-Priority: 1001
# ' | sudo tee /etc/apt/preferences.d/mozilla-firefox
# # This to ensure firefox automatic updates
# echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
# # Install firefox apt version
# sudo apt update && sudo apt install firefox -y

# Remove power demon to avoid any conflict with tlp and install tlp
# sudo apt remove power-profiles-daemon -y && sudo apt install tlp tlp-rdw -y

# Install software from deb-get
sudo deb-get install google-chrome-stable brave-browser code spotify-client bitwarden zoom blanket teamviewer virtualbox-7.0 

# Install flatpak
# sudo apt install flatpak
# Add the flathub respository   
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Install flatpak apps
# flatpak install flatseal francis

# Install JetbrainsMono NerdFont
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# # Update font cache
fc-cache -rv

# Install MongoDB 6 in ubuntu  version 22.04
# Install gnupg if it is not already available
sudo apt install gnupg -y
# Import MongoDb public GPG key
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
   --dearmor
# Create a list file
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
# Reaload local packages
sudo apt update
# Install latest stable version
sudo apt install mongodb-org -y  
# Start the mongod process 
sudo systemctl start mongod
# Start MongoDB following a system reboot
sudo systemctl enable mongod
# Show if the MongoDB has started 
# sudo systemctl status mongod

# Generate github ssh key
BASEDIR=$(cd $(dirname $0) && pwd)
$BASEDIR/generate_new_github_ssh_key.sh

# Add custom commands to .bashrc file  
cd ~
printf "\n# Custom commands\n# command to create github repos\nalias create='~/Development/shell-scripts/automate_repo.sh'\nalias wish='~/Development/shell-scripts/fb_birthday_wisher.sh'" >> .bashrc