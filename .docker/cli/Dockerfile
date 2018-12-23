FROM php:7.2.13-cli
MAINTAINER Marlon Buella <marlon.b.buella@gmail.com>

# Install composer
RUN apt update && \
    apt install git unzip wget -y && \
    cd ~ && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '$(wget -q -O - https://composer.github.io/installer.sig)') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

WORKDIR /var/www/mage2.ph

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

# Add composer auth
COPY config/composer/auth.json /root/.composer/auth.json

# PHP custom ini settings
COPY config/php/php.ini /usr/local/etc/php
