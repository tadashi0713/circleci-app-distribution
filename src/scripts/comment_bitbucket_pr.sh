#!/bin/bash

export BITBUCKET_TOKEN=${!PARAM_BITBUCKET_TOKEN}
[ -z "$BITBUCKET_TOKEN" ] && echo "A Bitbucket token must be supplied. Check the \"token\" parameter." && exit 1

pr_response=$(curl --request GET \
  --url "https://api.bitbucket.org/2.0/repositories/${PARAM_BITBUCKET_WORKSPACE}/${PARAM_BITBUCKET_REPO_SLUG}/pullrequests?at=${CIRCLE_BRANCH}&state=OPEN" \
  --header "Authorization: Bearer ${BITBUCKET_TOKEN}" \
  --header "Accept: application/json")

if [ $(echo $pr_response | jq -r ".size") -eq 0 ]; then
  echo "No PR found to update"
else
  pr_id=$(echo $pr_response | jq -r ".values[].id")
  curl --request POST \
    --url "https://api.bitbucket.org/2.0/repositories/${PARAM_BITBUCKET_WORKSPACE}/${PARAM_BITBUCKET_REPO_SLUG}/pullrequests/${pr_id}/comments" \
    --header "Authorization: Bearer ${BITBUCKET_TOKEN}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    --data '{
    "content": {
      "raw": "# CircleCI App Distribution\n| | |\n|-|-|\n|Platform|'${PLATFORM}'|\n|Name|'${APP_NAME}'|\n|ReleaseVersion|'${RELEASE_VERSION}'|\n|BuildVersion|'${BUILD_VERSION}'|\n|Identifier|'${IDENTIFIER}'|\n|Install URL|'${PAGE_URL}'|\n|QR Code|![](https://api.qrserver.com/v1/create-qr-code/?size=100x100&data='${PAGE_URL}')|"
    }
  }'
fi
