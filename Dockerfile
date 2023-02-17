# Container image that runs your code
FROM alpine:3.10
RUN apk add git curl openssh jq  gettext util-linux
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY main.sh /main.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]