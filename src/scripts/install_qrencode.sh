#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  brew install qrencode
elif [ "$(expr substr "$(uname -s)" 1 5)" == 'Linux' ]; then
  sudo apt-get install qrencode
else
  echo "Your platform ("$(uname -a)") is not supported."
  exit 1
fi
