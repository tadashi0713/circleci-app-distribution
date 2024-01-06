#!/bin/bash

pr_response=$(gh api \
-H "Accept: application/vnd.github+json" \
-H "X-GitHub-Api-Version: 2022-11-28" \
-H "Authorization: Bearer $GITHUB_TOKEN" \
/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls?head=$CIRCLE_PROJECT_USERNAME:$CIRCLE_BRANCH&state=open
)

# $(curl --location --request GET "https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls?head=$CIRCLE_PROJECT_USERNAME:$CIRCLE_BRANCH&state=open" \
# -H "Accept: application/vnd.github+json" \
# -H "Authorization: Bearer $GITHUB_TOKEN" \
# -H "X-GitHub-Api-Version: 2022-11-28" \
# )

echo $pr_response

# if [ $(echo $pr_response | jq length) -eq 0 ]; then
#   echo "No PR found to update"
# else
#   pr_comment_url=$(echo $pr_response | jq -r ".[]._links.comments.href")
# fi

# curl --location --request POST "$pr_comment_url" \
# -u $GH_USER:$GH_TOKEN \
# --header 'Content-Type: application/json' \
# --data-raw '{
# "body": "This would be the data to add"
# }'
