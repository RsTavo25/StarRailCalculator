FROM php:8.2-fpm-alpine

RUN apk add --update sudo \
    && adduser -D -u 1000 1000 \
    && echo "1000 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && addgroup 1000 1000 \
    && sed -i "s/^# \(%1000 ALL=(ALL) ALL\)/\1/" /etc/sudoers

#Updating Alpine dependences
RUN apk update; \
    apk upgrade; \
    apk add --no-cache $PHPIZE_DEPS zip unzip libzip-dev libpng-dev libxml2-dev linux-headers tzdata
#installing and enabling xdebug
#    && pecl install xdebug-3.2.0 \
#    && docker-php-ext-enable xdebug

#setting up timezone
ENV TZ=America/Argentina/Buenos_Aires
RUN echo "America/Argentina/Buenos_Aires" > /etc/timezone

#Installing php extensions
RUN docker-php-ext-install gd zip pdo pdo_mysql soap xml mysqli

#php ini
COPY ./Docker/php-hsr/php.ini /usr/local/etc/php/conf.d/99-app.ini
#xdebug ini
#COPY ./Docker/php-fpm/xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini

#Installing composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

#Copying files
WORKDIR /var/www/html/
COPY .. /var/www/html/

#Installing project dependences
#RUN composer install; \
#    php artisan l5-swagger:generate

EXPOSE 9000

RUN cd /var/www/html/
# #Running migrations see https://laravel.com/docs/9.x/migrations#forcing-migrations-to-run-in-production
#php artisan migrate
RUN chmod 777 -R storage
RUN chmod 777 -R vendor
#RUN php artisan app:register-microservice-routes
