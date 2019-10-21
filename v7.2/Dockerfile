FROM php:7.2.23-alpine

RUN apk update && apk add --no-cache $PHPIZE_DEPS
RUN apk add --no-cache zlib-dev gd-dev libwebp-dev freetype-dev libpng-dev libjpeg-turbo-dev \
    curl gmp-dev librdkafka-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-webp-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN docker-php-ext-configure bcmath && docker-php-ext-install bcmath
RUN docker-php-ext-install zip
RUN docker-php-ext-install gmp
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN pecl install rdkafka && docker-php-ext-enable rdkafka

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin
RUN mkdir -m 777 -p /var/composer/
ENV COMPOSER_HOME /var/composer/

# Install timecop
ENV PHP_TIMECOP_VERSION master
RUN curl -L -o /tmp/timecop.tar.gz https://github.com/hnw/php-timecop/archive/${PHP_TIMECOP_VERSION}.tar.gz \
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
