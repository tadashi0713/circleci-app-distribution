#!/bin/bash

project_slug=$(echo "$CIRCLE_BUILD_URL" | sed -e "s|https://circleci.com/||g" -e "s|/[0-9]*$||g")
artifacts=$(curl -X GET "https://circleci.com/api/v2/project/$project_slug/$CIRCLE_BUILD_NUM/artifacts" \
-H "Accept: application/json" \
-u "$CIRCLE_API_TOKEN:")
echo "export $ARTIFACT_URL_NAME=$(echo "$artifacts" | jq '.items[0].url')" >> "$BASH_ENV"
