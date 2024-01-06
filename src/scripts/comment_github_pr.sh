#!/bin/bash

pr_number=$(gh pr list --head github_pr --state open --json number --jq ".[].number")

if [ $pr_number -eq "" ]; then
  echo "No PR found to update"
else
  gh pr comment $pr_number --body "
  # CircleCI App Distribution
  | Name | ${APP_NAME} |
  | ReleaseVersion | ${RELEASE_VERSION} |
  | BuildVersion | ${BUILD_VERSION} |
  | Identifier | ${IDENTIFIER} |
  | Release Note | ${RELEASE_NOTE} |
  | Install URL | ${PAGE_URL} |
  "
fi
