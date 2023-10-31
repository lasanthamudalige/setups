# Refresh repos and install git, curl, vlc, ubuntu-restricted-extras and build-essential
sudo apt install ubuntu-restricted-extras fish htop neofetch git curl gnome-clocks gnome-dictionary vlc build-essential python3-pip python3-tk sqlite3 p7zip-full p7zip-rar obs-studio gimp chromium -y # Enter 'y' to download

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

# Remove power demon to avoid any conflict with tlp and install tlp
# sudo apt remove power-profiles-daemon -y && sudo apt install tlp tlp-rdw -y

# Install software from deb-get
sudo deb-get install brave-browser code spotify-client bitwarden zoom blanket teamviewer virtualbox-7.0 onlyoffice-desktopeditors discord

# Install flatpak apps
# flatpak install flathub flatseal io.gitlab.idevecore.Pomodoro joplin -y

# Install JetbrainsMono NerdFont
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# # Update font cache
fc-cache -vf

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
