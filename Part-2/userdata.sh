#!/bin/bash
sudo apt update -y
sudo apt install -y curl unzip git

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

echo -e ".
.
.
.
Installed nodejs
.
.
.
."

sudo apt install net-tools -y

git clone https://devarsh10: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@github.com/devarsh10/http-code.git /home/ubuntu/app
cd /home/ubuntu/app/Part-1
npm install

echo -e ".
.
.
.
npm install done
.
.
.
."

cat <<EOT > .env #overriding with existing .env
AWS_ACCESS_KEY_ID="AKIASZGKPSJIWXEXIATM"
AWS_SECRET_ACCESS_KEY="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"
AWS_REGION=us-east-1
BUCKET_NAME=list-bucket-content
PORT=3000
EOT

echo -e ".
.
.
.
created config file
.
.
.
."

sudo mkdir -p /home/log-dir && cd /home/log-dir && touch log-file.log
cd /home/ubuntu/app/Part-1
node code.js > /home/log-dir/log-file.log 2>&1  &

echo "Done"