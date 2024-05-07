#!make
include .env

build-72:
	cd ./v7.2 && docker build --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} --build-arg PHP_XDEBUG_VERSION=${XDEBUG_VERSION} --tag=php-for-dev:7.2 `pwd`

build-73:
	cd ./v7.3 && docker build --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} --build-arg PHP_XDEBUG_VERSION=${XDEBUG_VERSION} --tag=php-for-dev:7.3 `pwd`

build-74:
	cd ./v7.4 && docker build --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} --build-arg PHP_XDEBUG_VERSION=${XDEBUG_VERSION} --tag=php-for-dev:7.4 `pwd`

build-80:
	cd ./v8.0 && docker build --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} ---build-arg PHP_XDEBUG_VERSION=${XDEBUG_VERSION} -tag=php-for-dev:8.0 `pwd`

build-81:
	cd ./v8.1 && docker build --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} ---build-arg PHP_XDEBUG_VERSION=${XDEBUG_VERSION} -tag=php-for-dev:8.1 `pwd`

build-82:
	cd ./v8.2 && docker build --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} ---build-arg PHP_XDEBUG_VERSION=${XDEBUG_VERSION} -tag=php-for-dev:8.2 `pwd`

build-83:
	cd ./v8.3 && docker build --build-arg COMPOSER_VERSION=${COMPOSER_VERSION} ---build-arg PHP_XDEBUG_VERSION=${XDEBUG_VERSION} -tag=php-for-dev:8.3 `pwd`
