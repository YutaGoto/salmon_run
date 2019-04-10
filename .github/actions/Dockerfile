FROM debian:9.5-slim

LABEL "com.github.actions.name"="Create Pull Request"
LABEL "com.github.actions.description"="Create a Pull Request. You can create a pull request automatically. using GitHub REST API v3"
LABEL "com.github.actions.icon"="git-pull-request"
LABEL "com.github.actions.color"="blue"

LABEL "maintainer"="YutsGoto <you.goto.510@gmail.com>"

RUN apt update && apt install -y git jq curl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
