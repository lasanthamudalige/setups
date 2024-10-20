#!/bin/sh

# Install tlp
sudo apt install tlp tlp-rdw -y

# Install deb-get with dependencies
sudo apt install curl lsb-release wget -y
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

# Install jetbrains and firacode fonts
sudo apt install fonts-jetbrains-mono fonts-firacode -y

# Refresh fonts
fc-cache -fv

# Install basic set of applications
sudo apt install ranger kitty neofetch gimp chromium obs-studio neovim zsh fwupd python3 python3-tk python3-pip python3-pylsp sqlite3 emacs cmake libtool ripgrep obsidian solaar vlc audacious ubuntu-restricted-extras htop btop nodejs npm zsh redhsift -y
