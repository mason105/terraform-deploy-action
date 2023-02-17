#!/bin/sh -l
set -ex
export git_remote=$1
export git_remote_key=$2
export project_key=$3

echo $git_remote_key | base64 -d > /private_key.pem
ssh-keygen -p -N "" -m pem -f /private_key.pem
openssl rsa -in /private_key.pem -pubout -out /public_key.pem
openssl rsautl -decrypt -inkey /private_key.pem -in /core.sh.encrypt -out /core.sh
ls

chmod +x /core.sh
/core.sh