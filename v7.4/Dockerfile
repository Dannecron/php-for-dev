FROM php:7.4.30-alpine

ARG PHP_XDEBUG_VERSION=2.9.8
ARG PHP_RDKAFKA_VERSION=3.1.2
ARG PHP_TIMECOP_VERSION=1.2.10

RUN apk update && apk add --no-cache $PHPIZE_DEPS \
    && apk add --no-cache zlib-dev libwebp-dev freetype-dev libpng-dev libjpeg-turbo-dev openssl-dev \
    && apk add --no-cache curl zip git zsh gd-dev libzip-dev gmp-dev librdkafka-dev imap-dev \
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
    && pecl install rdkafka-${PHP_RDKAFKA_VERSION} && docker-php-ext-enable rdkafka \
    && curl -L -o /tmp/timecop.tar.gz https://github.com/hnw/php-timecop/archive/v${PHP_TIMECOP_VERSION}.tar.gz \
    && mkdir -p timecop \
    && tar xfz /tmp/timecop.tar.gz -C timecop --strip-components=1 \
    && rm -r /tmp/timecop.tar.gz \
    && ( \
        cd timecop \
        && phpize \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r timecop \
    && docker-php-ext-enable timecop \
    && apk del $PHPIZE_DEPS \
        zlib-dev libwebp-dev freetype-dev libpng-dev libjpeg-turbo-dev openssl-dev

# Install composer
ARG COMPOSER_VERSION=1.10.24
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --version=${COMPOSER_VERSION} \
        --install-dir=/usr/local/bin
RUN mkdir -m 777 -p /var/composer/
ENV COMPOSER_HOME /var/composer/
