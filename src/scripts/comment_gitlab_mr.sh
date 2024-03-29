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
export GITLAB_TOKEN=${!PARAM_GITLAB_TOKEN}
[ -z "$GITLAB_TOKEN" ] && echo "A GitLab token must be supplied. Check the \"token\" parameter." && exit 1

if [[ $PARAM_GITLAB_HOST = "" ]]; then
  glab auth login --token $GITLAB_TOKEN
else
  glab auth login --token $GITLAB_TOKEN --hostname $PARAM_GITLAB_HOST
fi

# Comment to Merge Request
mr_res=$(glab mr list --source-branch $CIRCLE_BRANCH)
if [[ $mr_res =~ "No open merge requests match your search in" ]]; then
  printf '\n%s' "$mr_res"
else
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
  | QR Code | ![](https://api.qrserver.com/v1/create-qr-code/?size=100x100&data=${PAGE_URL}) |
  "
fi
