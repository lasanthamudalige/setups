# Install neccessary package
sudo pacman -S bluez ufw bash-completion p7zip zip unzip fish python tk python-pip sqlite neovim flatpak ttf-jetbrains-mono-nerd ttf-fira-code elisa vlc thunderbird kdegraphics-thumbnailers ffmpegthumbs gwenview kcalc kbackup ktorrent okular skanlite skanpage spectacle chromium kcron kclock libreoffice-fresh neofetch gimp chromium obs-studio

# Enable bluetooth
sudo systemctl start bluetooth.service
# Start with the system
sudo systemctl enable bluetooth.service

# Install tlp
# sudo apt install tlp tlp-rdw -y

# Enable the firewall
sudo ufw enable
# Check firewall status
sudo ufw status verbose
# Start with the system
sudo systemctl enable ufw.service

# Install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  

# Install AUR helper 
sudo pacman -S --needed base-devel git
mkdir Programs
cd Programs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install programs from AUR
yay -S onlyoffice-bin zoom visual-studio-code-bin spotify postman-bin brave-bin mongodb-bin ttf-ms-fonts

# Install flatpak applications
flatpak install flathub flatseal io.gitlab.idevecore.Pomodoro joplin postman -y

# Update font cache
fc-cache -vf

# Start and show status of mongodb
sudo systemctl start mongodb
sudo systemctl status mongodb

# Enable mongodb
sudo systemctl enable mongodb

# Generate github ssh key
BASEDIR=$(cd $(dirname $0) && pwd)
$BASEDIR/generate_new_github_ssh_key.sh

# Add custom commands to .bashrc file  
cd ~
printf "\n# Custom commands\n# command to create github repos\nalias create='~/Development/shell-scripts/automate_repo.sh'\n# command to wish facebook birthdays\nalias wish='~/Development/shell-scripts/fb_birthday_wisher.sh'" >> .bashrc
