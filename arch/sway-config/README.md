# My arch sway wm setup

## Table of contents

* [Arch install summery](#arch-install-summery)
* [Using dotfiles](#using-dotfiles)
* [Other stuff](#other-stuff)

## Arch install summery

***I installed it using archinstall***

* Disk partition - ext4 with 1 partition with encryption
* profile - Desktop with Sway login with ly
* Sound - Pipewire
* kernel - LTS kernel
* Additional packages - 'firefox' 'kitty' 'git'
* Network configuration - NetworkManager
* Other settings are stock setting
  
## Using dotfiles

* ***Install firefox, kitty terminal and git if not installed***
  
1. Clone the repo

   <!-- This is how to properly declare code snippets  -->  
    ```bash
    git clone https://github.com/lasanthamudalige/dotfiles.git
    ```

2.Do essential things

* Setup wifi and bluetooth

  * Install wifi and bluetooth

      ```bash
      sudo pacman -S iwd bluez bluez-utils -y
      ```

    * Enable and start wifi and bluetooth

      ```bash
      systemctl enable iwd
        
      systemctl start iwd

      systemctl enable bluetooth

      systemctl start bluetooth
      ```

      * Use ***iwctl*** and ***bluetoothctl*** commands to access wifi and bluetooth
  
  * Install all essential Arch packages using:

    ```bash
    sudo pacman -S pacman-contrib xdg-user-dirs ufw bash-completion wofi i3status mako fish -y
    ```

  * Install yay aur helper

    ```bash
    sudo pacman -S --needed base-devel git
    mkdir Programs
    cd Programs
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    ```

  * Install all essential AUR packages using:

    ```bash
    yay -S wob swaynagmode wlsunet #progressbar, sway exit menu and day/night gamma adjustment program
    ```

    * Setup ***wob*** using this [link](https://github.com/francma/wob/blob/master/contrib/README.md) (If not working out of the box)

* Change pacman configuration
  
  * Open the config file

      ```bash
      sudo vim /etc/pacman.conf
      ```

    * ***Uncomment "#Color" to change the black and white terminal to a colorful one.***
    * ***Add "ILoveCandy" below it to change default install progress bar.***

    * ***Save the file.***  

    * Activate the paccache timer to clean package cache

      ```bash
      sudo systemctl enable paccache.timer
      ```

    * Run xdg-user-dirs to create directories

      ```bash
      xdg-user-dirs-update
      ```

    * Setup firewall
      * Enable UFW

         ```bash
        sudo ufw enable
        ```

      * To check status

        ```bash
        sudo ufw status verbose
        ```

      * To auto start with the system

        ```bash
        sudo systemctl enable ufw.service
        ```

3.Move config files

* Move config folders to "~/.config" folder.

  ```bash
  sudo mv sway/ i3status/ kitty/ ~/.config/
  ```

4.Customizing sway setup

* ~~Install Ly login manager~~ (Can now do in the arch install)

    ```bash
    sudo pacman -S ly
    ```

  * Enable the service

    ```bash
    sudo systemctl enable ly.service
    ```

* Install cutomizing programs

  ```bash
  sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code
  ```

5.Install basic set of applications

***You need to get a torrent client a screenshot tool and a clipboard manager for this***

* Thunar (file manager)
* Ranger (cli file manager)
* mpv (media player)
* zathura (pdf viewer)
* ristretto/imv (image viewer/cli img viewer)
* mousepad (text editor)
* libereoffice (office suite)
* neofetch (CLI system information tool)
* gimp (image manipulation tool)
* chromium (browser)
* obs-studio (screen-recoder)

  ```bash
  sudo pacman -S thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler ranger atool elinks ffmpegthumbnailer highlight imagemagick libcaca lynx mediainfo odt2txt poppler python-chardet python-pillow sudo transmission-cli ueberzug  p7zip zip unzip noto-fonts-emoji mpv zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps ristretto imv mousepad gspell libxfce4ui libreoffice-fresh neofetch gimp chromium obs-studio # or libreoffice-still for stable version
  ```

  <!-- Install onlyoffice from AUR -->
  ```bash
  yay -S onlyoffice-bin zoom
  ```

## Other stuff

### Change shell to fish

* Install fish shell

  ```bash
  sudo pacman -S fish
  ```

  * Change shell to fish

    ```bash
    chsh -s /usr/bin/fish
    ```

### Install visual studio code, spotify, postman and brave browser with yay

```bash
yay -S visual-studio-code-bin spotify postman-bin brave-bin
```

***More spotify thirdparty players [here](https://wiki.archlinux.org/title/Spotify)***

* ***To fix visual code code not saving login info install***

  ```bash
  sudo pacman -S gnome-keyring
  ```

  * add a new password for the keyring

### Setting programming stuff
  
* Generate ssh key for github

  ```bash
  # Generate a new ssh key
  ssh-keygen -t ed25519 -C "lasantha1130@gmail.com" # Add your email here by replacing "lasantha1130@gmail.com"

  # Add ssh key to ssh-agent
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519

  # Print ssh public key to clipboard
  cat ~/.ssh/id_ed25519.pub
  ```

* Install python, sqlite

    ```bash
    sudo pacman -S python tk python-pip sqlite
    ```
  
* Install nvm(Node version manager)

  ```bash
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  
  ```

    ***Install nvm before doing below steps***

  * Install nvm in fish shell

    * Install fisher plugin

        ```bash
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        ```

    * Install fish nvm

        ```bash
        fisher install FabioAntunes/fish-nvm edc/bass
        ```

* Install nodemon for nodejs

   ```bash
   npm install -g nodemon # or using yarn: yarn global add nodemon
   ```

* Install json server from nodejs

   ```bash
   npm install -g json-server
   ```

* Install MongoDB

   ```bash
   yay -S mongodb-bin
   ```

  * To run mongodb services

    ```bash
    sudo systemctl start mongodb

    sudo systemctl status mongodb
    ```

  * To enable mongodb

    ```bash
    sudo systemctl enable mongodb
    ```

  * To test connection status

    ```bash
    mongod --version
    ```

* Other programs

  ```bash
  yay -S termdown # commandline countdown program
  yay -S devtodo # commandline todo list
  sudo pacman -S calc # commandline calculator
  sudo pacman -S ncspot # commandline spotify program
  ```

### Keyboard shortcuts

* Launch terminal apps directly from wofi (Like fish, ranger)

  * Use Shift + Return (Enter key)

## Screenshots (Still working on it)