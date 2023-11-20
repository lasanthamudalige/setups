# A script to auto install necessay apps in Linux mint

## Table of content

* [Custom changes](#custom-changes)
* [Programming stuff](#programming-stuff)

## Generate_new_ssh_key.sh

* This will generate a ssh key for github

## Custom changes

### Add a custom shortcut to open terminal for mod + enter command
  
  ```bash
  gnome-terminal --tab
  ```

### Change shell to fish
  
* Install fish shell ***(If you didn't run the script)***

    ```bash
    sudo apt install fish
    ```

* Change shell to fish

    ```bash
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

### Change Themes of Flatpak apps using Flatseal

* Go to All applications and locate **filesystem**

* Add theme location in **Other files**

* Copy themes folder inn usr/share/themes to ~/.themes folder

    ```bash
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

- Install nvm in fish shell

  - Install fisher plugin

        ```bash
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        ```

      -Install fish nvm

        ```bash
        fisher install FabioAntunes/fish-nvm edc/bass
        ```

-Install nodemon from nodejs

  ```bash
   npm install -g nodemon # or using yarn: yarn global add nodemon
   ```

 -Install json server from nodejs

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