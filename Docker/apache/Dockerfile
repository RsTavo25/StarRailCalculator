FROM httpd:2.4.51-alpine3.15

RUN apk update; \
    apk upgrade; \
    apk add --no-cache tzdata; \
    mkdir -p /var/www/html/;

ENV TZ=America/Argentina/Buenos_Aires
RUN echo "America/Argentina/Buenos_Aires" > /etc/timezone

# Copy apache vhost file to proxy php requests to php-fpm container
COPY ./Docker/apache/app.apache.conf /usr/local/apache2/conf/app.apache.conf
RUN echo "Include /usr/local/apache2/conf/app.apache.conf" >> /usr/local/apache2/conf/httpd.conf
