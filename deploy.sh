#!/bin/bash

npm install
npm run build
composer install --no-dev
php artisan migrate --force
