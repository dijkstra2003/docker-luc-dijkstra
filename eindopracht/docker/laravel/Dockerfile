FROM php:fpm-alpine

COPY composer.lock composer.json /var/www/

WORKDIR /var/www

# install all extensions and depencies for laravel
RUN apk update && apk add \
    mysql-client \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    oniguruma-dev

# Install packages for laravel
RUN docker-php-ext-install pdo_mysql mbstring zip 

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for Laravel
RUN addgroup -S  www
RUN adduser -S www -s /bin/bash www

# Copy application
COPY . /var/www/
COPY --chown=www:www . /var/www

USER www

EXPOSE 9000

CMD php-fpm
