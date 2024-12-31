sudo apt update -y
sudo apt install -y curl unzip git

sudo apt install -y curl unzip git

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

git clone https://github.com/devarsh10/node-s3-app.git /home/ubuntu/app
cd /home/ubuntu/app
npm install

cat <<EOT > .env
PORT=80
AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
AWS_REGION=us-east-1
BUCKET_NAME=YOUR_BUCKET_NAME
EOT

node index.js &
