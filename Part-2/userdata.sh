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

git clone https://github.com/devarsh10/http-code.git /home/ubuntu/app
cd /home/ubuntu/app/Part-1
npm install

echo -e ".
.
.
.
npm install done
Now installing jq
.
.
.
."

sudo apt install -y jq
echo -e ".
.
.
jq Installed
.
.
."

SECRET=$(aws secretsmanager get-secret-value --secret-id http-proj-secret --query SecretString --output text)

# Parse out the individual credentials from the JSON
AWS_ACCESS_KEY_ID=$(echo $SECRET | jq -r '.AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY=$(echo $SECRET | jq -r '.AWS_SECRET_ACCESS_KEY')

cat <<EOT > .env #overriding with existing .env
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
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