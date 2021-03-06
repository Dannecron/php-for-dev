FROM php:7.3.27-alpine

RUN apk update && apk add --no-cache $PHPIZE_DEPS \
    && apk add --no-cache zlib-dev gd-dev libwebp-dev freetype-dev libpng-dev libjpeg-turbo-dev \
        curl zip libzip-dev gmp-dev librdkafka-dev imap-dev openssl-dev git zsh
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-webp-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure bcmath && docker-php-ext-install bcmath \
    && docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip \
    && docker-php-ext-install gmp

ARG PHP_XDEBUG_VERSION=2.9.8
RUN pecl install xdebug-${PHP_XDEBUG_VERSION} && docker-php-ext-enable xdebug

ARG PHP_RDKAFKA_VERSION=3.1.2
RUN pecl install rdkafka-${PHP_RDKAFKA_VERSION} && docker-php-ext-enable rdkafka
RUN docker-php-ext-configure imap --with-imap-ssl \
    && docker-php-ext-install imap

# Install composer
ARG COMPOSER_VERSION=1.10.17
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --version=${COMPOSER_VERSION} \
        --install-dir=/usr/local/bin
RUN mkdir -m 777 -p /var/composer/
ENV COMPOSER_HOME /var/composer/

# Install timecop
ARG PHP_TIMECOP_VERSION=1.2.10
RUN curl -L -o /tmp/timecop.tar.gz https://github.com/hnw/php-timecop/archive/v${PHP_TIMECOP_VERSION}.tar.gz \
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
    && docker-php-ext-enable timecop
