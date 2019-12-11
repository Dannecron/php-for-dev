FROM php:7.4.0-alpine

ARG PHP_XDEBUG_VERSION=2.9.0
ARG PHP_RDKAFKA_VERSION=3.1.2
ARG PHP_TIMECOP_VERSION=1.2.10

RUN apk update && apk add --no-cache $PHPIZE_DEPS
RUN apk add --no-cache zlib-dev gd-dev libwebp-dev freetype-dev libpng-dev libjpeg-turbo-dev \
    curl zip libzip-dev gmp-dev librdkafka-dev imap-dev openssl-dev
RUN docker-php-ext-configure gd --enable-gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
    && docker-php-ext-install gd
RUN docker-php-ext-configure bcmath && docker-php-ext-install bcmath
RUN docker-php-ext-configure zip --with-zip && docker-php-ext-install zip
RUN docker-php-ext-install gmp
RUN pecl install xdebug-${PHP_XDEBUG_VERSION} && docker-php-ext-enable xdebug
RUN pecl install rdkafka-${PHP_RDKAFKA_VERSION} && docker-php-ext-enable rdkafka
RUN PHP_OPENSSL=yes docker-php-ext-configure imap --with-imap-ssl \
    && docker-php-ext-install imap

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin
RUN mkdir -m 777 -p /var/composer/
ENV COMPOSER_HOME /var/composer/

# Install timecop
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
