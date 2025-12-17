#!/bin/bash

sudo apt-get update


curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs


sudo npm install -g pm2


sudo apt-get install -y nginx

sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF'

sudo service nginx restart