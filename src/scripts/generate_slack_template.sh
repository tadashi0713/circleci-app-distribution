#!/bin/bash

template=$(cat << EOS
{
  "blocks": [
    {
      "type": "section",
      "fields": [
        {
          type: "mrkdwn",
          text: "*Branch:* ${CIRCLE_BRANCH}"
        },
        {
          type: "mrkdwn",
          text: "*Name:* ${APP_NAME}"
        },
        {
          type: "mrkdwn",
          text: "*Identifier:* ${IDENTIFIER}"
        },
        {
          type: "mrkdwn",
          text: "*ReleaseVersion:* ${RELEASE_VERSION}"
        },
        {
          type: "mrkdwn",
          text: "*BuildVersion:* ${BUILD_VERSION}"
        },
        {
          type: "mrkdwn",
          text: "*Release Note:* ${RELEASE_NOTE}"
        }
      ]
    }
  ]
}
EOS
)

echo "$template" | jq > /tmp/AppDistributionSlackTemplate.json
echo 'export APP_DISTRIBUTION_SLACK_TEMPLATE=$(cat /tmp/AppDistributionSlackTemplate.json)' >> "$BASH_ENV"
