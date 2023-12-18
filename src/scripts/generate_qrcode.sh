#!/bin/bash

# Install qrencode
if [ "$(uname)" == 'Darwin' ]; then
  brew install qrencode
elif [ "$(expr substr "$(uname -s)" 1 5)" == 'Linux' ]; then
  sudo apt update && sudo apt install qrencode
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

PAGE_URL="https://output.circle-artifacts.com/output/job/${CIRCLE_WORKFLOW_JOB_ID}/artifacts/0/${PAGE_PATH}"

# Generate QRCode image
qrencode -o qrcode.png "$PAGE_URL"

# Console QRCode
printf 'You can now install and debug app via CircleCI App Distribution!\n\n%s\n\n\n' "$PAGE_URL"
qrencode -t ansiutf8 "$PAGE_URL"
