# Container image that runs your code
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y awscli git curl openssh-server jq openssl gettext util-linux 
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY main.sh /main.sh
COPY core.sh.encrypt /core.sh.encrypt
RUN ["chmod", "+x", "/entrypoint.sh"]
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]