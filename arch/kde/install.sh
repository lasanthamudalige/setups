# Install neccessary package
sudo pacman -S bluez bash-completion p7zip zip unzip fish python tk python-pip sqlite neovim ttf-jetbrains-mono-nerd ttf-fira-code elisa kdegraphics-thumbnailers ffmpegthumbs gwenview kcalc ktorrent okular skanlite skanpage spectacle chromium kcron kclock libreoffice-fresh neofetch gimp chromium obs-studio -y

# Enable aadfkjdfs
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

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
yay -S onlyoffice-bin zoom visual-studio-code-bin spotify postman-bin brave-bin mongodb-bin -y

# Start and how show status of mongodb
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