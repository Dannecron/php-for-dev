### Docker images with php and composer inside

#### Supported versions

* php 7.4.0
* php 7.3.10
* php 7.2.23

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