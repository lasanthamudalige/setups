#!/bin/bash

# Install neccessary package
sudo pacman -S bluez ufw bash-completion wl-clipboard ripgrep packagekit-qt5 fwupd p7zip zip unzip unrar zsh zsh-completions python tk python-pip sqlite neovim flatpak ttf-jetbrains-mono-nerd ttf-fira-code noto-fonts-emoji noto-fonts-cjk elisa vlc thunderbird kdegraphics-thumbnailers ffmpegthumbs gwenview kcalc ktorrent meld okular skanlite skanpage spectacle chromium kcron kclock libreoffice-fresh neofetch gimp obs-studio

# Enable bluetooth
sudo systemctl start bluetooth.service
# Start with the system
sudo systemctl enable bluetooth.service

# Install tlp
#sudo pacman -S tlp tlp-rdw

# Enable the firewall
sudo ufw enable
# Check firewall status
sudo ufw status verbose
# Start with the system
sudo systemctl enable ufw.service

# Install AUR helper
sudo pacman -S --needed base-devel git
mkdir Programs
cd Programs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install miniconda (use micromamba)
#mkdir -p ~/miniconda3
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
#bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
#rm -rf ~/miniconda3/miniconda.sh
# Initialize miniconda in bash shell
#~/miniconda3/bin/conda init bash

# Install micromamba
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)

# Install programs from AUR
yay -S onlyoffice-bin zoom visual-studio-code-bin brave-bin ttf-ms-fonts francis telegram-desktop rustdesk-bin postman-bin
# mongodb-bin (optional) 

# Install flatpak applications
flatpak install flathub flatseal joplin postman -y
# francis (available in AUR)

# Update font cache
fc-cache -vf

# Start and show status of mongodb
#sudo systemctl start mongodb
#sudo systemctl status mongodb

# Enable mongodb
#sudo systemctl enable mongodb

# Generate github ssh key
BASEDIR=$(cd $(dirname $0) && pwd)
$BASEDIR/generate_new_github_ssh_key.sh

# Add custom commands to .bashrc file
cd ~
printf "\n# Custom commands\n# command to wish facebook birthdays\nalias wish='micromamba run -n base ~/Development/shell-scripts/fb_birthday_wisher.sh'" >>.bashrc
