#/bin/sh

docker build --build-arg PHP_TAG=7.4 --build-arg OMEKA_TAG=v3.0.2 -t biblibre/omeka-s-ci:3.0.2-php7.4 .

for PHP_TAG in '7.4' '8.0' '8.1'; do
    docker build --build-arg PHP_TAG=$PHP_TAG --build-arg OMEKA_TAG=v3.1.1 -t biblibre/omeka-s-ci:3.1.1-php$PHP_TAG .
done
