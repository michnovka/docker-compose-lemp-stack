FROM php:8.0-fpm

RUN apt-get update && \
    apt-get install -y git zip curl libcurl3-dev libxml2-dev libssl-dev zlib1g-dev libpng-dev libjpeg-dev libwebp-dev libonig-dev libc-client-dev libkrb5-dev cron sudo libmemcached-dev libz-dev memcached libmemcached-tools

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN pecl install memcached && docker-php-ext-enable memcached

RUN docker-php-ext-install mbstring && docker-php-ext-enable mbstring
RUN docker-php-ext-install fileinfo && docker-php-ext-enable fileinfo
RUN docker-php-ext-install iconv && docker-php-ext-enable iconv
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap && docker-php-ext-enable imap
RUN docker-php-ext-install intl && docker-php-ext-enable intl
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install curl && docker-php-ext-enable curl
RUN docker-php-ext-install tokenizer && docker-php-ext-enable tokenizer
RUN docker-php-ext-install ctype && docker-php-ext-enable ctype
RUN docker-php-ext-install session && docker-php-ext-enable session
RUN docker-php-ext-install xml && docker-php-ext-enable xml
RUN docker-php-ext-install dom && docker-php-ext-enable dom
RUN docker-php-ext-install phar && docker-php-ext-enable phar
RUN docker-php-ext-configure gd --with-jpeg --with-webp && docker-php-ext-install gd && docker-php-ext-enable gd


RUN usermod -u 1000 www-data

RUN chown -R www-data:www-data /var/www/html

CMD bash -c "cron && php-fpm"
