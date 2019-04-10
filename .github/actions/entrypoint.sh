#!/bin/bash

if [[ -z "$GITHUB_TOKEN" ]]; then
    echo "Set the GITHUB_TOKEN env variable."
    exit 1
fi

if [[ -z "$GITHUB_REPOSITORY" ]]; then
    echo "Set the GITHUB_REPOSITORY env variable."
    exit 1
fi

if [[ -z "$BASE_BRANCH" ]]; then
    echo "Set the BASE_BRANCH env variable."
    exit 1
fi

if [[ -z "$HEAD_BRANCH" ]]; then
    echo "Set the HEAD_BRANCH env variable."
    exit 1
fi

URI=https://api.github.com
API_VERSION=v3
API_HEADER="Accept: application/vnd.github.${API_VERSION}+json"
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"

JSON_HEADER="Content-Type:application/json"

GITHUB_PULL_URL="${URI}/repos/${GITHUB_REPOSITORY}/pulls"
GITHUB_REF_URL="${URI}/repos/${GITHUB_REPOSITORY}/git/refs"

# create ref
data=$(cat <<EOF
{
  "ref": "refs/heads/${HEAD_BRANCH}",
  "sha": "${GITHUB_SHA}"
}
EOF
)
echo $data | curl \
    -XPOST \
    -H "${AUTH_HEADER}" \
    -H "${API_HEADER}" \
    -H "${JSON_HEADER}" \
    -d @- "${GITHUB_REF_URL}"

# create pull request
data=$(cat <<EOF
{
  "title": "${PULL_REQUEST_TITLE}",
  "body": "${PULL_REQUEST_BODY}",
  "base": "${BASE_BRANCH}",
  "head": "${HEAD_BRANCH}"
}
EOF
)
echo $data | curl \
    -XPOST \
    -H "${AUTH_HEADER}" \
    -H "${API_HEADER}" \
    -H "${JSON_HEADER}" \
    -d @- $GITHUB_PULL_URL

exit 0
