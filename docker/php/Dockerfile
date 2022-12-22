FROM php:8.2-fpm

ARG user
ARG uid

# Lumen packages

RUN docker-php-ext-install mysqli pdo_mysql

# Memcached dependencies -- not really needed at the moment
ENV MEMCACHED_DEPS zlib1g-dev libz-dev libmemcached-dev memcached
RUN apt-get update && apt-get install -y nano bash
RUN set -xe \
    # && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
    && apt-get -y install $MEMCACHED_DEPS \
    && pecl install memcached \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
    && rm -rf /usr/share/php7 \
    && rm -rf /tmp/* 

# User groups & perms
RUN useradd -G www-data,root -u $uid -d /home/$user $user
USER $user
WORKDIR /var/www
