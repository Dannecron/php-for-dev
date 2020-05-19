### Docker images with php and composer inside

![continious integration](https://github.com/Dannecron/php-docker/workflows/continious%20integration/badge.svg?branch=master&event=push)

Images can be found on [docker hub](https://hub.docker.com/repository/docker/dannecron/php-for-dev)

#### Supported versions

* php 7.4.6
    * xdebug 2.9.5
    * rdkafka 3.1.2
    * timecop 1.2.10
* php 7.3.18
    * xdebug 2.9.5
    * rdkafka 3.1.2
    * timecop 1.2.10
* php 7.2.31
    * xdebug 2.7.2
    * rdkafka 3.1.2
    * timecop 1.2.10

#### Build

To build container just use one of this commands:
```bash
make build-72
make build-73
make build-74
```

#### Run

After making image run

```bash
docker run -it --rm -v `pwd`:/var/www/project -w /var/www/project --user=1000 local-composer:7.* sh
```

where replace `*` minor php version.
