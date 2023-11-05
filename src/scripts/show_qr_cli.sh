#!/bin/bash

echo "You can now install and debug app via CircleCI App Distribution!\n$APP_URL\n\n"
qrencode -t ansi $APP_URL