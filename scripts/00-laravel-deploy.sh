#!/usr/bin/env bash

# ref. https://github.com/render-examples/php-laravel-docker/blob/master/scripts/00-laravel-deploy.sh

echo "Running composer"
composer global require hirak/prestissimo
composer install --no-dev --working-dir=/var/www/html

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force
