#!/bin/bash

# Enable parallel downloads and fastest mirror
#sudo sh -c 'echo -e  "\nmax_parallel_downloads=10\nfastestmirror=true" >> /etc/dnf/dnf.conf'

# Enable RPM Fusion Repository
# Free
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
# Non-free
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Install needed programs
sudo dnf install fish htop neofetch git curl gnome-clocks gnome-dictionary vlc python3-pip python3-tkinter sqlite3 p7zip p7zip-plugins unzip unrar ffmpegthumbnailer  obs-studio gimp chromium discord gnome-tweaks gnome-extensions-app @development-tools kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras -y # Enter 'y' to download

# Clear cache to show thumbnails nautilus
rm -rf ~/.cache/thumbnails/fail/gnome-thumbnail-factory/*

# Install multimedia codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia 

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Remove power demon to avoid any conflict with tlp and install tlp
# sudo dnf remove power-profiles-daemon -y && sudo dnf install tlp tlp-rdw -y

# Install brave browser
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y

# Install visual studio code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code -y # or code-insiders

# Install zoom
wget https://zoom.us/client/5.16.6.382/zoom_x86_64.rpm
sudo dnf install zoom_x86_64.rpm -y

# Install teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo dnf install teamviewer.x86_64.rpm -y

# Install virtualbox
cat <<EOF | sudo tee /etc/yum.repos.d/virtualbox.repo 
[virtualbox]
name=Fedora VirtualBox Repo
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/38/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox_2016.asc
EOF
sudo dnf install VirtualBox-7.0 -y
sudo usermod -a -G vboxusers $USER
#newgrp vboxusers
#id $USER

# Install only office
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
sudo dnf install onlyoffice-desktopeditors.x86_64.rpm -y

# Install flatpak apps
flatpak install flathub flatseal io.gitlab.idevecore.Pomodoro joplin postman bitwarden -y

# Install JetbrainsMono NerdFont
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# # Update font cache
fc-cache -vf

# Install MongoDB 6 for fedora 38 (Not working)
# sudo tee /etc/yum.repos.d/mongodb-org-6.0.repo<<EOF
# [mongodb-org-6.0]
# name=MongoDB Repository
# baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/6.0/x86_64/
# gpgcheck=1
# enabled=1
# gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
# EOF
# # Install latest version
# sudo dnf install mongodb-org -y
# # Start MongoDB following a system reboot
# sudo systemctl enable mongod
# # Start the mongod process 
# sudo systemctl start mongod
# # Show if the MongoDB has started
# sudo systemctl status mongod

# Generate github ssh key
BASEDIR=$(cd $(dirname $0) && pwd)
$BASEDIR/generate_new_github_ssh_key.sh

# Add custom commands to .bashrc file  
cd ~
printf "\n# Custom commands\n# command to create github repos\nalias create='~/Development/shell-scripts/automate_repo.sh'\n# command to wish facebook birthdays\nalias wish='~/Development/shell-scripts/fb_birthday_wisher.sh'" >> .bashrc
