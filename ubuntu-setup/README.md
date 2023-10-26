# A script to auto install necessay apps in Ubuntu

## Table of content
* [Custom changes](#custom-changes)
* [Programming stuff](#programming-stuff)


## Install.sh 
  - This script will install 
    - From apt
      - ubuntu restricted extras
      - fish shell
      - htop
      - neofetch
      - neovim
      - git
      - curl
      - gnome-clocks
      - gnome-dictionary
      - vlc
      - build essential
      - python3 pip
      - python3 TK
      - sqlite3
      - p7zip-full and p7zip-rar
    -From snap
      - obs studio
      - postman
    - From curl
      - nvm (node version manager)
      - deb-get (package manager)  
     - From deb-get
        - google chrome
        - brave browser
        - visual studio Code
        - spotify
        - bitwarden
        - zoom
        - blanket
        - teamviewer
        - virtualbox 7.0
     - From Flatpak
        - flatseal
        - francis
        - planner
        - joplin

## Generate_new_ssh_key.sh
  - This will generate a ssh key for github
    
## Custom changes

### Change shell to fish
  
  - Install fish shell ***(If you didn't run the script)***
      ```
      sudo apt install fish
      ```
      
  - Change shell to fish
      ```
      chsh -s /usr/bin/fish
      ```
   
### Install tlp (On laptops)
  ```
  sudo apt install tlp
  ```
  
  - Start tlp
    ```
    sudo tlp start
    ```
    
### Change Themes of Flatpak apps using Flatseal 

  - Go to All applications and locate **filesystem**
    
    - Add theme location in **Other files**
    
      - In Linux Mint
        ```
        /usr/share/themes
        ```
  
  - Add GTK_THEME variable to the **Environment**
    
    - Add Adwaita Dark theme
      ```
      GTK_THEME=Adwaita-dark
      ```

## Programming stuff

### Install nvm (If you didn't run the script)

  - Install nvm(Node version manager)
    ```
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  
    ```

### Add nvm to fish shell
  - ***Install nvm before doing below steps***
    
    - Install nvm in fish shell
      
      - Install fisher plugin
        ```
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        ```
      - Install fish nvm
        ```
        fisher install FabioAntunes/fish-nvm edc/bass
        ```
 - Install nodemon for nodejs
   ```
   npm install -g nodemon # or using yarn: yarn global add nodemon
   ```
   
### Add alias to execute custom shell scripts
   Add this to end of the ~/.bashrc file
   ```
   # Custom commands
   # command to create github repos
   alias create="~/Development/shell-scripts/automate_repo.sh"
   alias wish="~/Development/shell-scripts/fb_birthday_wisher.sh"
   ```
