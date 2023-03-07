FROM ghcr.io/mason105/terraform_deploy:e551100e
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN apt-get update && apt-get install -y awscli git curl openssh-client jq openssl gettext util-linux 
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY main.sh /main.sh
COPY core.sh.encrypt /core.sh.encrypt
COPY core.bin.enc /core.bin.enc
RUN ["chmod", "+x", "/entrypoint.sh"]
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]