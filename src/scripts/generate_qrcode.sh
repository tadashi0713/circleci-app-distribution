#!/bin/bash

# Generate QRCode image
qrencode -o qrcode.png "$PAGE_URL"

# Console QRCode
printf 'You can now install and debug app via CircleCI App Distribution!\n\n%s\n\n\n' "$PAGE_URL"
qrencode -t ansiutf8 "$PAGE_URL"
