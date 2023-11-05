#!/bin/bash

printf 'You can now install and debug app via CircleCI App Distribution!\n%s\n\n' "$APP_URL"
qrencode -t ansi "$APP_URL"
