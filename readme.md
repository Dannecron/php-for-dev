### Docker images with php and composer inside

![continious integration](https://github.com/Dannecron/php-docker/workflows/continious%20integration/badge.svg?branch=master&event=push)

#### Supported versions

* php 7.4.3
    * xdebug 2.9.0
    * rdkafka 3.1.2
    * timecop 1.2.10
* php 7.3.15
    * xdebug 2.7.2
    * rdkafka 3.1.2
    * timecop 1.2.10
* php 7.2.28
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
