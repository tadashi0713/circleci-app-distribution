#!/bin/bash

pr_response=$(gh api \
-H "Accept: application/vnd.github+json" \
-H "X-GitHub-Api-Version: 2022-11-28" \
-H "Authorization: Bearer $GITHUB_TOKEN" \
/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls?head=$CIRCLE_PROJECT_USERNAME:$CIRCLE_BRANCH&state=open
)

if [ $(echo $pr_response | jq length) -eq 0 ]; then
  echo "No PR found to update"
else
  pr_number=$(echo $pr_response | jq -r ".[].number")
fi

echo $pr_number

gh pr comment $pr_number --edit-last --body "
# CircleCI App Distribution
"
