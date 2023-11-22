# A script to auto install necessay apps in Linux mint

## Table of content

* [Arch install summery](#arch-install-summery)
* [Custom changes](#custom-changes)
* [Programming stuff](#programming-stuff)

## Arch install summery

***I installed it using archinstall***

* Disk partition - ext4 with 1 partition with encryption
* profile - kde-plasma desktop with login with ly
* Sound - Pipewire
* kernel - Stable kernel (Linux)
* Additional packages - 'firefox'
* Network configuration - NetworkManager
* Other settings are stock setting

## Install.sh

* This script will install
  * From pacman
    * bluez
    * ufw
    * bash-completion
    * fwupd
    * p7zip
    * zip
    * unzip
    * fish
    * python
    * python-tk
    * python-pip
    * sqlite
    * neovim
    * flatpak
    * ttf-jetbrains-mono-nerd
    * ttf-fira-code
    * noto-fonts-emoji
    * elisa
    * vlc
    * thunderbird
    * kdegraphics-thumbnailers
    * ffmpegthumbs
    * gwenview
    * kcalc
    * ktorrent
    * okular
    * skanlite
    * skanpage
    * spectacle
    * chromium
    * kcron
    * kclock
    * libreoffice-fresh
    * neofetch
    * gimp
    * chromium
    * obs-studio
  * From curl
    * nvm (node version manager)
  * From AUR
    * Only office
    * Brave browser
    * Visual studio Code
    * Spotify
    * Mongodb
    * MS-fonts
  * From Flatpak
    * Flatseal
    * Pomodoro timer
    * Joplin

## Generate_new_ssh_key.sh

* This will generate a ssh key for github

## Custom changes

* Change pacman configuration
  
  * Open the config file

      ```bash
      sudo vim /etc/pacman.conf
      ```

    * ***Uncomment "#Color" to change the black and white terminal to a colorful one.***
    * ***Add "ILoveCandy" below it to change default install progress bar.***

    * ***Save the file.***  

### Change shell to fish
  
* Install fish shell ***(If you didn't run the script)***

    ```bash
    sudo pacman -S install fish
    ```

* Change shell to fish

    ```bash
    chsh -s /usr/bin/fish
    ```

### Power management (On laptops)
  
* ~~Install tlp (Not recommended)~~

    ```bash
    sudo pacman -S install tlp
    ```
  
  * ~~Start tlp~~

      ```bash
      sudo tlp start
      ```

* Install auto-cpufreq  (In the github stars)

* Disable bluetooth on startup

  * Open bluetooth main file

      ```bash
      sudo nano /etc/bluetooth/main.conf
      ```

  * ***Go to the bottom and set "AutoEnable" to False***

### Change Themes of Flatpak apps using Flatseal

* Go to All applications and locate **filesystem**

  * Add theme location in **Other files**

    * In Linux Mint

        ```bash
        /usr/share/themes
        ```

* Copy themes folder inn usr/share/themes to ~/.themes folder

    ```
    sudo cp -r /usr/share/themes/. ~/.themes
    ```

* Add theme folder to **Files**

    ```bash
    ~/.themes
    ```

* Add GTK_THEME variable to the **Environment**

  * Add Adwaita Dark theme

    ```bash
    GTK_THEME=Adwaita-dark
    ```

## Programming stuff

### Install nvm (If you didn't run the script)

* Install nvm(Node version manager)

    ```bash
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  
    ```

### Add nvm to fish shell

* ***Install nvm before doing below steps***

  * Install nvm in fish shell

    * Install fisher plugin

        ```bash
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        ```

    * Install fish nvm

        ```bash
        fisher install FabioAntunes/fish-nvm edc/bass
        ```

* Install nodemon from nodejs

   ```bash
   npm install -g nodemon # or using yarn: yarn global add nodemon
   ```

* Install json server from nodejs

   ```bash
   npm install -g json-server
   ```

### Add alias to execute custom shell scripts

   Add this to end of the ~/.bashrc file

   ```bash
   # Custom commands
   # command to create github repos
   alias create="~/Development/shell-scripts/automate_repo.sh"
   alias wish="~/Development/shell-scripts/fb_birthday_wisher.sh"
   ```
