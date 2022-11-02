FROM php:8.1-fpm

RUN apt-get update && \
    apt-get install -y git zip curl libcurl3-dev

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Uncomment to have mysqli extension installed and enabled
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install curl && docker-php-ext-enable curl

RUN usermod -u 1000 www-data

RUN chown -R www-data:www-data /var/www/html
