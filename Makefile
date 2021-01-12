build-72:
	cd ./v7.2 && docker build --tag=php-for-dev:7.2 `pwd`

build-73:
	cd ./v7.3 && docker build --tag=php-for-dev:7.3 `pwd`

build-74:
	cd ./v7.4 && docker build --tag=php-for-dev:7.4 `pwd`

build-80:
	cd ./v8.0 && docker build --tag=php-for-dev:8.0 `pwd`
