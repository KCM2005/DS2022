#!/bin/bash

ssh -i C:/Users/kew6jk/Downloads/kcm-user-key.pem ec2-user@54.167.238.0

/usr/bin/apt update -y
/usr/bin/apt upgrade -y
/usr/bin/apt install -y git
/usr/bin/apt install -y awscli
/usr/bin/apt install -y python3

echo "Verifying installations..."

git --version

aws --version

python3 --version

echo "Installations complete."
