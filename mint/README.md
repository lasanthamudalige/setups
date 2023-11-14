# A script to auto install necessay apps in Linux mint

## Table of content

* [Custom changes](#custom-changes)
* [Programming stuff](#programming-stuff)

## Install.sh

* This script will install
  * From apt
    * ubuntu restricted extras
    * fish shell
    * htop
    * neofetch
    * neovim
    * git
    * curl
    * gnome-clocks
    * gnome-dictionary
    * vlc
    * build essential
    * python3 pip
    * python3 tk
    * sqlite3
    * p7zip-full and p7zip-rar
    * obs studio
    * gimp
    * chromium
    * audacious
  * From curl
    * nvm (node version manager)
    * deb-get (package manager)  
  * From deb-get
    * brave browser
    * visual studio Code
    * spotify
    * bitwarden
    * zoom
    * blanket
    * teamviewer
    * virtualbox 7.0
    * discord
  * From Flatpak
    * flatseal
    * pomodoro
    * joplin

## Generate_new_ssh_key.sh

* This will generate a ssh key for github

## Custom changes

### Change shell to fish
  
* Install fish shell ***(If you didn't run the script)***

      ```
      sudo apt install fish
      ```

* Change shell to fish

      ```
      chsh -s /usr/bin/fish
      ```

### Power management (On laptops)
  
* ~~Install tlp (Not recommended)~~

        ```bash
        sudo apt install tlp
        ```
  
  * ~~Start tlp~~

      ```bash
      sudo tlp start
      ```

* Install auto-cpufreq  (In the github stars)

### Linux mint  

* ~~To change cursor theme in flatpak apps~~(now fixed when changed in settings)

    ```bash
    sudo update-alternatives --config x-cursor-theme
    ```

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

   ```
   # Custom commands
   # command to create github repos
   alias create="~/Development/shell-scripts/automate_repo.sh"
   alias wish="~/Development/shell-scripts/fb_birthday_wisher.sh"
   ```
