# Container image that runs your code
FROM amazonlinux:2
RUN  yum install -y git curl openssh jq openssl gettext util-linux
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY main.sh /main.sh
COPY core.sh.encrypt /core.sh.encrypt
RUN ["chmod", "+x", "/entrypoint.sh"]
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]