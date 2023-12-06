#!/bin/bash

# This script runs the post build script commands needed to run the application

cd /home/site/wwwroot || exit 1
wget -O /home/site/wwwroot/ssl/DigiCertGlobalRootG2.crt.pem https://cacerts.digicert.com/DigiCertGlobalRootG2.crt.pem >> /home/startup.log 2>&1
php artisan migrate --force >> /home/startup.log 2>&1
cp /home/site/wwwroot/default /etc/nginx/sites-available/default && service nginx reload >> /home/startup.log 2>&1
