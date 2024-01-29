#!/bin/bash

template=$(cat << EOS
{
  "blocks": [
		{
			"type": "section",
			"text": {
				"text": "*${APP_NAME}* distributed from *${CIRCLE_PROJECT_REPONAME}* project!",
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
			},
      "accessory": {
				"type": "image",
				"image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
				"alt_text": "cute cat"
			}
			"fields": [
        {
					"type": "mrkdwn",
					"text": "*Build URL:*\n<${CIRCLE_BUILD_URL}|${CIRCLE_BUILD_NUM}>"
				},
        {
					"type": "mrkdwn",
					"text": "*Branch:*\n${CIRCLE_BRANCH}"
				},
				{
					"type": "mrkdwn",
					"text": "*Platform:*\n${PLATFORM}"
				},
				{
					"type": "mrkdwn",
					"text": "*ReleaseVersion:*\n${RELEASE_VERSION}"
				},
				{
					"type": "mrkdwn",
					"text": "*BuildVersion:*\n${BUILD_VERSION}"
				},
				{
					"type": "mrkdwn",
					"text": "*Identifier:*\n${IDENTIFIER}"
				}
			]
		}
  ]
}
EOS
)

echo "$template" | jq > /tmp/AppDistributionSlackTemplate.json
echo 'export APP_DISTRIBUTION_SLACK_TEMPLATE=$(cat /tmp/AppDistributionSlackTemplate.json)' >> "$BASH_ENV"
