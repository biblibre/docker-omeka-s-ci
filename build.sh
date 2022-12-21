#/bin/sh

set -e

docker build --build-arg PHP_TAG=7.4 --build-arg OMEKA_TAG=v3.0.2 -t biblibre/omeka-s-ci:3.0.2-php7.4 .
docker build --build-arg PHP_TAG=7.4 --build-arg OMEKA_TAG=v3.1.2 -t biblibre/omeka-s-ci:3.1.2-php7.4 .
docker build --build-arg PHP_TAG=8.0 --build-arg OMEKA_TAG=v3.1.2 -t biblibre/omeka-s-ci:3.1.2-php8.0 .
docker build --build-arg PHP_TAG=7.4 --build-arg OMEKA_TAG=v3.2.3 -t biblibre/omeka-s-ci:3.2.3-php7.4 .
docker build --build-arg PHP_TAG=8.0 --build-arg OMEKA_TAG=v3.2.3 -t biblibre/omeka-s-ci:3.2.3-php8.0 .
docker build --build-arg PHP_TAG=7.4 --build-arg OMEKA_TAG=v4.0.0-rc -t biblibre/omeka-s-ci:4.0.0-rc-php7.4 .
docker build --build-arg PHP_TAG=8.0 --build-arg OMEKA_TAG=v4.0.0-rc -t biblibre/omeka-s-ci:4.0.0-rc-php8.0 .
docker build --build-arg PHP_TAG=8.1 --build-arg OMEKA_TAG=v4.0.0-rc -t biblibre/omeka-s-ci:4.0.0-rc-php8.1 .
