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
			"fields": [
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
					"text": "*Build URL:* <${CIRCLE_BUILD_URL}|${CIRCLE_BUILD_NUM}>"
				}
			]
		}
  ]
}
EOS
)

echo "$template" | jq > /tmp/AppDistributionSlackTemplate.json
echo 'export APP_DISTRIBUTION_SLACK_TEMPLATE=$(cat /tmp/AppDistributionSlackTemplate.json)' >> "$BASH_ENV"
