#/bin/sh

for PHP_TAG in '7.1' '7.2' '7.3' '7.4'; do
    docker build --build-arg PHP_TAG=$PHP_TAG --build-arg OMEKA_TAG=v3.0.2 -t biblibre/omeka-s-ci:3.0.2-php$PHP_TAG .
done
