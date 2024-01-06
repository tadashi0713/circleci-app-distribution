#!/bin/bash

template=$(cat << EOS
{
  "blocks": [
		{
			"type": "section",
			"text": {
				"text": "A message *with some bold text* and _some italicized text_.",
				"type": "mrkdwn"
			},
			"fields": [
				{
					"type": "mrkdwn",
					"text": "*Priority*"
				},
				{
					"type": "mrkdwn",
					"text": "*Type*"
				},
				{
					"type": "plain_text",
					"text": "High"
				},
				{
					"type": "plain_text",
					"text": "String"
				}
			]
		}
  ]
}
EOS
)

echo "$template" | jq > /tmp/AppDistributionSlackTemplate.json
echo 'export APP_DISTRIBUTION_SLACK_TEMPLATE=$(cat /tmp/AppDistributionSlackTemplate.json)' >> "$BASH_ENV"
