FROM php:7.2.13-fpm
MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

# Install required PHP extensions and PECL modules.
  # RUN
  # buildDeps=" \
  #        default-libmysqlclient-dev \
  #    " \
  RUN runtimeDeps=" \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \
#    sendmail-bin \
#    sendmail \
#    sudo \
    " \
    && apt-get update && apt-get install -y $runtimeDeps \
    && docker-php-ext-configure gd \
      --with-freetype-dir=/usr/include/ \
      --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd intl opcache pdo_mysql soap xsl zip \
#    && apk del $buildDeps \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install bcmath

# PHP custom ini settings
COPY config/php/php.ini /usr/local/etc/php
