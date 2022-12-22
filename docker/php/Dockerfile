FROM php:8.2-fpm

ARG user
ARG uid


# System dependencies
# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    cron \
    unzip

# PHP dependency packages

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer binary
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# User groups & perms
RUN useradd -G www-data,root -u $uid -d /home/$user $user
USER $user
WORKDIR /var/www
