ARG PHP_TAG=latest
FROM php:$PHP_TAG

RUN apt-get update && apt-get install -y \
        git \
        gnupg \
        imagemagick \
        libicu-dev \
        unzip \
    && docker-php-ext-install intl pdo_mysql \
    && cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini \
    && curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && echo "deb https://deb.nodesource.com/node_14.x buster main" > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

ARG OMEKA_TAG=v3.0.2

WORKDIR /usr/src/omeka-s
RUN git clone --depth 1 --branch $OMEKA_TAG https://github.com/omeka/omeka-s.git . \
    && npm install \
    && npx gulp init \
    && rm -f application/test/config/database.ini

ENV LANG C.UTF-8

COPY wait-for-db.php /usr/local/libexec/
