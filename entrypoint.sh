#!/bin/sh -l
#set -ex
export project=$1
export git_remote_key=$2
export root_folder=$3
export precmd=$4
export cmd=$5


echo $git_remote_key | base64 -d > /private_key.pem
chmod 600 /private_key.pem
cat /private_key.pem
ssh-keygen -p -N "" -m pem -f /private_key.pem
openssl rsa -in /private_key.pem -pubout -out /public_key.pem
md5sum /core.sh.encrypt
ls

#openssl rsautl -decrypt -inkey ./private_key.pem -in ./core.sh.encrypt -out /core.sh
#openssl version
openssl rsautl -decrypt -inkey /private_key.pem -in /core.bin.enc -out /core.bin
openssl enc -d -aes-256-cbc -in /core.sh.encrypt -out /core.sh -pass file:/core.bin



chmod +x /core.sh
/core.sh $project $root_folder $precmd $cmd