FROM php:8.2.0-alpine

ARG PHP_XDEBUG_VERSION=3.1.6
ARG COMPOSER_VERSION=2.4.4

RUN apk update && apk add --no-cache $PHPIZE_DEPS \
    && apk add --no-cache zlib-dev gd-dev libwebp-dev freetype-dev libpng-dev libjpeg-turbo-dev \
        curl zip libzip-dev gmp-dev \
        imap-dev openssl-dev git zsh \
    && docker-php-ext-configure gd --enable-gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
    && docker-php-ext-install gd \
    && docker-php-ext-configure bcmath && docker-php-ext-install bcmath \
    && docker-php-ext-configure zip --with-zip && docker-php-ext-install zip \
    && docker-php-ext-install gmp \
    && PHP_OPENSSL=yes docker-php-ext-configure imap --with-imap-ssl \
    && docker-php-ext-install imap \
    && pecl install xdebug-${PHP_XDEBUG_VERSION} && docker-php-ext-enable xdebug \
    && apk del $PHPIZE_DEPS \
        zlib-dev libwebp-dev freetype-dev libpng-dev libjpeg-turbo-dev openssl-dev

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --version=${COMPOSER_VERSION} \
        --install-dir=/usr/local/bin
RUN mkdir -m 777 -p /var/composer/
ENV COMPOSER_HOME /var/composer/
