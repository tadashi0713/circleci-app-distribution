#!/bin/bash

# Install Glab
if [ "$(uname)" == 'Darwin' ]; then
  brew install glab
elif [ "$(expr substr "$(uname -s)" 1 5)" == 'Linux' ]; then
  curl -sSL "https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository" | sudo bash
  sudo apt install glab
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# Login
glab login --hostname $GITLAB_HOST --token $GITLAB_TOKEN

# Comment to Merge Request
glab mr note --message "
# CircleCI App Distribution
|   |   |
|---|---|
| Platform | ${PLATFORM} |
| Name | ${APP_NAME} |
| ReleaseVersion | ${RELEASE_VERSION} |
| BuildVersion | ${BUILD_VERSION} |
| Identifier | ${IDENTIFIER} |
| Install URL | ${PAGE_URL} |
| QR Code | ![](${QR_URL}) |
"
