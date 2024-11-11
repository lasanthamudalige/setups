#!/bin/sh

# Install bluetooth, enable  and start it.
#sudo pacman -S bluez bluez-utils
#sudo systemctl enable bluetooth.service
#sudo systemctl start bluetooth.service

# Install TLP, enable and start it.
#sudo pacman -S tlp tlp-rdw
#sudo systemctl enable tlp.service
#sudo tlp start
#cp tlp/00-template.conf /etc/tlp.d/

# Install yay AUR helper
sudo pacman -S --needed base-devel git
mkdir Programs
cd Programs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Setup firewall
sudo pacman -S ufw
sudo ufw enable
sudo ufw status verbose
sudo systemctl enable ufw.service

# Copy config files to Home directory
cp -r emacs/ kitty/ nvim/ ranger/ ~/.config/
cp vim/.vimrc  ~

# Install Main applications from Pacman
sudo pacman -S ufw bash-completion wl-clipboard wl-clip-persist speech-dispatcher fwupd dosfstools ntfs-3g exfat-utils arj lrzip lzop unarchiver p7zip zip unzip unrar zsh zsh-completions python tk python-pip sqlite vim neovim flatpak ttf-jetbrains-mono-nerd ttf-firacode-nerd noto-fonts-emoji noto-fonts-cjk timeshift vlc audacious thunderbird kdegraphics-thumbnailers ffmpegthumbs gwenview kamoso kimageformats qt6-imageformats kcalc ktorrent meld okular ebook-tools kdegraphics-mobipocket spectacle kcron kclock libreoffice-fresh neofetch gimp obsidian obs-studio libfdk-aac libva-intel-driver libva-mesa-driver luajit python sndio v4l2loopback-dkms solaar emacs-nativecomp ripgrep fd cmake man-db man-pages kitty ranger atool elinks ffmpegthumbnailer highlight imagemagick libcaca lynx mediainfo odt2txt poppler python-chardet python-pillow transmission-cli ueberzug nodejs npm yakuake --needed

# Install Other applications from AUR
yay -S onlyoffice-bin vscodium-bin ttf-ms-fonts brave-bin

# Install oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
# Install Autosuggestions plugin for zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Install syntax highlighting plugin for zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy ZSH config file to Home directory
cp zsh/.zshrc ~

# Install NVM
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  

# Install Miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
zsh ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init zsh

# Install Python and markdown LSP
sudo pacman -S python-lsp-server marksman --needed

# Install --lts version from nvm and install nodemon and json-server for javascript
#./nvm_install.sh

# Generate a ssh key for github
./generate_new_github_ssh_key.sh
