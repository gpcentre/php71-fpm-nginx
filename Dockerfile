FROM  php:fpm-alpine
MAINTAINER Philip G <gp@gpcentre.net>

RUN apk add --update --no-cache libtool build-base autoconf \
    freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev libmcrypt-dev

RUN docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) \
    gd opcache pdo_mysql mcrypt

RUN apk del build-base autoconf freetype libpng libjpeg-turbo freetype-dev libjpeg-turbo-dev

# RUN pecl install xdebug-2.5.0 \
#    && docker-php-ext-enable xdebug

ENV HOME /root
ENV TERM xterm

WORKDIR /usr/local/etc

RUN echo 'alias ls="ls --color=auto"' >> ~/.bashrc
RUN echo 'alias ll="ls --color=auto -l"' >> ~/.bashrc