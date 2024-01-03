# A script to auto install necessay apps in Arch Linux

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
    * wl-copy
    * ripgrep
    * fwupd
    * p7zip
    * zip
    * unzip
    * zsh zsh-completions
    * python
    * python-tk
    * python-pip
    * sqlite
    * neovim
    * flatpak
    * ttf-jetbrains-mono-nerd
    * ttf-fira-code
    * noto-fonts-emoji
    * noto-fonts-cjk
    * vlc
    * thunderbird
    * ffmpegthumbs
    * transmission-gtk
    * meld
    * chromium
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
    * MS-fonts
    * Francis
    * Telegram
    * Rustdesk
    * postman-bin
    * Mongodb (optional)
  * From Flatpak
    * Flatseal
    * ~~Francis~~ (available in AUr)
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

### ~~Miniconda settings~~ (use micromamba)

* Initialize conda for the current shell

  ```bash
  conda init zsh # or bash
  ```

### Zsh shell

* Install zsh shell

  ```bash
    sudo pacman -S zsh zsh-completions
  ```

* List available shells

  ```bash
  chsh -l
  ```

* Change default shell to zsh

  ```bash
  chsh -s /usr/bin/zsh # And log back in
  ```

* Install [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)

  ```bash
  wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  sh install.sh
  ```

* add zsh-autosuggestions

  1. Clone [this](https://github.com/zsh-users/zsh-autosuggestions) repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

      ```bash
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      ```

  2. Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):

      ```bash
      plugins=( 
      # other plugins...
      zsh-autosuggestions
      )
      ```

  3. Start a new terminal session.

  * copy nvm setting from .bashrc file to .zshrc

* ***Note***
~~* Install Miniconda
* Install the Latest selenium webdriver to Miniconda base environment
* Download the gecko driver and move it to /usr/local/bin~~

* Install micromamba

```bash
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
```
    - Respond to all the input prompts

* Install the Latest selenium webdriver to Miniconda base environment
* Download the gecko driver and move it to /usr/local/bin

### Neovim stuff

* Move neovim config file to $HOME/.config/

```bash
sudo cp -r .config/neovim/ ~/.config/

```

* Install clipboard tool for wayland (Already in the install.sh file)

```bash
sudo pacman -S wl-copy
```

* Install pyright from npm

```bash
npm i -g pyright
```

* Install tree-sitte-cli

```bash
npm i -g tree-sitter-cli
```

* Install ripgrep

```bash
sudo pacman -S ripgrep
```
