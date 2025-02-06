#!/bin/sh
cd /var/www/html/
# #Running migrations see https://laravel.com/docs/9.x/migrations#forcing-migrations-to-run-in-production
#php artisan migrate
chmod 777 -R storage
chmod 777 -R vendor
php artisan app:register-microservice-routes
php-fpm
