#!/bin/bash

template=$(cat << EOS
{
  "blocks": [
		{
			"type": "section",
			"text": {
				"text": "${PLATFORM} app *${APP_NAME}* distributed!",
				"type": "mrkdwn"
			},
      "accessory": {
				"type": "button",
				"text": {
					"type": "plain_text",
					"text": "Go to Distribution Page"
				},
				"style": "primary",
				"url": "${PAGE_URL}"
			}
			"fields": [
        {
					"type": "mrkdwn",
					"text": "*Build URL:* <${CIRCLE_BUILD_URL}|${CIRCLE_BUILD_NUM}>"
				},
        {
					"type": "mrkdwn",
					"text": "*Branch:* ${CIRCLE_BRANCH}"
				},
				{
					"type": "mrkdwn",
					"text": "*ReleaseVersion:* ${RELEASE_VERSION}"
				},
				{
					"type": "mrkdwn",
					"text": "*BuildVersion:* ${BUILD_VERSION}"
				},
				{
					"type": "mrkdwn",
					"text": "*Identifier:* ${IDENTIFIER}"
				},
        {
					"type": "mrkdwn",
					"text": "*Release Note:* ${RELEASE_NOTE}"
				}
			]
		}
  ]
}
EOS
)

echo "$template" | jq > /tmp/AppDistributionSlackTemplate.json
echo 'export APP_DISTRIBUTION_SLACK_TEMPLATE=$(cat /tmp/AppDistributionSlackTemplate.json)' >> "$BASH_ENV"
