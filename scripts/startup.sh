#!/bin/bash

# This script runs the post build script commands needed to run the application

cd /home/site/wwwroot || exit 1
mkdir ssl >> /home/startup.log 2>&1
wget --no-check-certificate -O /home/site/wwwroot/ssl/DigiCertGlobalRootCA.crt.pem https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem
php artisan migrate --force >> /home/startup.log 2>&1
cp /home/site/wwwroot/default /etc/nginx/sites-available/default && service nginx reload >> /home/startup.log 2>&1
