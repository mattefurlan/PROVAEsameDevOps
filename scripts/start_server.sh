#!/bin/bash
cd /var/www/node-app

pm2 start app.js --name "NodeApp" --update-env

pm2 save