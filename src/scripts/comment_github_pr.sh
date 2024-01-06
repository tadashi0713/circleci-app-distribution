#!/bin/bash

pr_response=$(gh pr list --head $CIRCLE_BRANCH --state open --json number)

if [ $(echo $pr_response | jq length) -eq 0 ]; then
  echo "No PR found to update"
else
  pr_number=$(echo $pr_response | jq -r ".[].number")
  gh pr comment $pr_number --body "
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
fi
