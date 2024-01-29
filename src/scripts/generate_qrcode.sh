#!/bin/bash

printf 'You can now install and debug app via CircleCI App Distribution!\n\n%s\n\n\n' "$PAGE_URL"
qrencode -t ansiutf8 "$PAGE_URL"
