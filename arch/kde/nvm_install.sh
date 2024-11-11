#!/bin/sh

konsole -e zsh -c '
  # Load NVM (adjust the path if nvm.sh is located elsewhere)
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Install the latest LTS version of Node.js
  echo "Installing latest LTS version of Node.js..." &&
  nvm install --lts &&

  # Install nodemon and json-server globally
  echo "Installing nodemon and json-server..." &&
  if npm install -g nodemon json-server; then
    echo "Installation complete."
  else
    echo "Installation failed."
  fi

  # Add a newline and exit message
  echo "" &&
  echo "Exiting the terminal..." &&
  sleep 3
'

