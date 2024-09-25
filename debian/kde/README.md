# Debian Kde setup

## Table of contents

* [Using dotfiles](#using-dotfiles)
* [Other stuff](#other-stuff)

## Using dotfiles

1. Clone the repo

   <!-- This is how to properly declare code snippets  -->  
    ```bash
    git clone https://github.com/lasanthamudalige/setups
    ```

2. Do essential things

  * Install tlp and enable it
  
    - Install tlp
  
	    ```bash
	    sudo apt install tlp tlp-rdw -y
	    ```
		
		- For thinkpads
		
			```bash
			sudo apt install tp-smapi-dkms acpi-call-dkms
			```
			
  * Enable tlp

    ```bash
    sudo systemctl enable tlp
    ```

  * Install [deb-get](https://github.com/wimpysworld/deb-get) program

    ```bash
    sudo apt install curl lsb-release wget
    curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
    ```

3. Move config files

- Move config folders to "~/.config" folder.

  ```bash
  cp -r emacs/ nvim/ ranger/ kitty/ ~/.config/
  ```

4. Customizing the setup

    ```bash
    sudo apt install fonts-jetbrains-mono fonts-firacode -y
    ```
  
- Refresh fonts using

    ```bash
    fc-cache -fv
    ```

5. Install basic set of applications like: ranger, kitty, neofetch, gimp, chromium, obs-studio, neovim, zsh, python tk and pip, sqlite3, emacs and dependancies, thunderbird, timeshift, ktorrent, solaar, vlc, htop, btop, onlyoffice, zoom, deadbeef music player, obsidian, brave browser, codium (FOSS version of vs code)

    ```bash
    sudo apt install ranger kitty neofetch gimp chromium obs-studio neovim zsh fwupd python3 python3-tk python3-pip sqlite3 emacs cmake libtool ripgrep thunderbird timeshift ktorrent solaar vlc htop btop -y
    ```

    <!-- Install onlyoffice from deb-get -->
    ```bash
    deb-get install onlyoffice-desktopeditors zoom deadbeef-static obsidian brave-browser codium
    ```

  Install spotify-client using [this](https://www.spotify.com/us/download/linux/)
  
* ***Change defaults to relevent programs***

## Other stuff

### Zsh shell

* Install zsh shell

  ```bash
    sudo apt install zsh -y
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

  - Clone [this](https://github.com/zsh-users/zsh-autosuggestions) repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

      ```bash
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      ```

  - Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)

      ```bash
      plugins=( 
      # other plugins...
      zsh-autosuggestions
      )
      ```

  -Start a new terminal session.

* add zsh-syntax-highlighting (optional)

  - Clone [this](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

      ```bash
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
      ```

  - Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)

      ```bash
      plugins=( 
      # other plugins...
      zsh-syntax-highlighting 
      )
      ```

* copy nvm setting from .bashrc file to .zshrc

~~### Install visual studio code, spotify and brave browser with yay~~

  ```bash
  deb-get install code brave-browser
  ```

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
  sudo apt install python3 python3-tk python3-pip sqlite3 -y
  ```
  
* Install nvm(Node version manager)

  ```bash
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  
  ```

* Install nodemon and json-server for nodejs

  ```bash
  npm install -g nodemon json-server
  ```

* Install Miniconda

  ```bash
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  zsh ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -rf ~/miniconda3/miniconda.sh
  ~/miniconda3/bin/conda init zsh
  ```
  
  * Disable base automatic base activation

    ```bash
    conda config --set auto_activate_base false
    ```
  
* Optional

    ```bash
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    ~/miniconda3/bin/conda init bash
    ```

* Install the Latest selenium webdriver to Miniconda base environment
  
* Download the gecko driver and move it to /usr/local/bin

<!-- ~~* Install micromamba~~ -->

<!--   ```bash -->
<!--   "${SHELL}" <(curl -L micro.mamba.pm/install.sh) -->
<!--   ``` -->

<!-- * **Respond to all the input prompts** -->

* Install the Latest selenium webdriver to Miniconda base environment
  
* Download the gecko driver and move it to /usr/local/bin

### Neovim stuff

* Move neovim config file to $HOME/.config/

  ```bash
  sudo cp -r .config/neovim/ ~/.config/
  ```

* Install pyright from npm

  ```bash
  npm i -g pyright
  ```

* Install tree-sitte-cli

  ```bash
  npm i -g tree-sitter-cli
  ```

* ~~Install ripgrep~~

  ```bash
  sudo apt install ripgrep -y
  ```

### Emacs stuff

* Install Python language server

  ``` bash
  sudo apt install python3-pylsp -y
  ```

* Install MongoDB
  
  * [Visit the website for instructions](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)
