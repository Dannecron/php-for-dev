### Docker images with php and composer inside

[![continuous integration](https://github.com/Dannecron/php-for-dev/actions/workflows/continuous-integration.yml/badge.svg?branch=master)](https://github.com/Dannecron/php-for-dev/actions)

Images can be found on [docker hub](https://hub.docker.com/repository/docker/dannecron/php-for-dev)

#### Supported versions

* php 8.4.1
  * removed `imap` extension ([reason](https://wiki.php.net/rfc/unbundle_imap_pspell_oci8))
* php 8.3.14
* php 8.2.26
* php 8.1.31
* php 8.0.30 **(latest)**
* php 7.4.33
  * xdebug 3.1.6
  * rdkafka 6.0.3
  * timecop 1.2.10
* php 7.3.33
  * xdebug 3.1.6
  * rdkafka 6.0.3
  * timecop 1.2.10
* php 7.2.34
  * xdebug 3.1.6
  * rdkafka 6.0.3
  * timecop 1.2.10

All images includes:
* composer 2.8.1
* xdebug 3.4.0 (except 7.x)
* [zsh](https://www.zsh.org/), that allowed using [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) and its plugins for improving user experience.

#### Build

To build container just use one of these commands:
```bash
make build-72
make build-73
make build-74
make build-80
make build-81
make build-82
make build-83
make build-84
```

#### Run

After making image run

```bash
docker run -it --rm -v `pwd`:/var/www/project -w /var/www/project --user=1000 php-for-dev:M.m sh
```

where replace `M` with major, and `m` with minor php version.

##### Using oh-my-zsh from local machine

To use already installed `oh-my-zsh` inside docker container we should pass couple volumes and environment variables:
* `-v ~/.zshrc:/home/user/.zshrc` - configuration file for `zsh`
* `-v ~/.oh-my-zsh:/home/user/oh-my-zsh` - directory with installed `oh-my-zsh`
* `-e HOME=/home/user` - define user home directory

Full run command would be looks like
```bash
docker run -it --rm \
    -v `pwd`:/var/www/project \
    -v ~/.zshrc:/home/user/.zshrc \
    -v ~/.oh-my-zsh:/home/user/oh-my-zsh \
    -e HOME=/home/user \
    -w /var/www/project \
    --user=1000 php-for-dev:M.m zsh
```
