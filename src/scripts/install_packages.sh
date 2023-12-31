#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
  brew install qrencode
  gem install ipa_analyzer
elif [ "$(expr substr "$(uname -s)" 1 5)" == 'Linux' ]; then
  sudo apt update && sudo apt install qrencode
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
