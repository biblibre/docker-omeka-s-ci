FROM php:8.0

RUN apt-get update && apt-get install -y \
        git \
        gnupg \
        imagemagick \
        libicu-dev \
        libcurl4-openssl-dev \
        libxml2-dev \
        unzip \
    && docker-php-ext-install intl pdo_mysql \
    && pecl install xdebug-3.2.0 \
    && docker-php-ext-enable xdebug \
    && cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini \
    && curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key > /etc/apt/trusted.gpg.d/nodesource.asc \
    && echo "deb https://deb.nodesource.com/node_18.x buster main" > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/omeka-s
RUN git clone --depth 1 --branch v4.0.1 https://github.com/omeka/omeka-s.git . \
    && npm install \
    && npx gulp init \
    && rm -f application/test/config/database.ini

ENV LANG C.UTF-8
ENV XDEBUG_MODE coverage

COPY wait-for-db.php /usr/local/libexec/
