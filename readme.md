### Docker images with php and composer inside

#### Build

```bash
make build-72
```

or

```
make build-73
```

#### Run

After making image run

```bash
docker run -it --rm -v `pwd`:/var/www/project -w /var/www/project --user=1000 local-composer:7.2 sh
```

or

```bash
docker run -it --rm -v `pwd`:/var/www/project -w /var/www/project --user=1000 local-composer:7.3 sh
```