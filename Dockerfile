FROM php:7.1-fpm

MAINTAINER Caleb Foster <foster.caleb@gmail.com>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libmemcached-dev \
        libxml2-dev \
        libssl-dev \
        curl \
        nano \
    && docker-php-ext-install \
        iconv \
        mbstring \
        mcrypt \
        mysqli \
        pdo_mysql \
        soap \
        zip \
        opcache \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && pecl install xdebug && docker-php-ext-enable xdebug \
#    && pecl install mongodb && docker-php-ext-enable mongodb \
    && pecl install redis && docker-php-ext-enable redis \
#    && yes '' | pecl install imagick && docker-php-ext-enable imagick
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer