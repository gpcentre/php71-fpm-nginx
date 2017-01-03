FROM php:fpm
MAINTAINER Philip G <gp@gpcentre.net>

# Some useful debugging tools I use locally for development
RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y wget curl locate zip unzip telnet vim && \ 
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN pecl install xdebug-2.5.0 \
#    && docker-php-ext-enable xdebug

RUN docker-php-ext-install mysqli pdo pdo_mysql

ENV HOME /root
ENV TERM xterm

WORKDIR /usr/local/etc

RUN echo 'alias ls="ls --color=auto"' >> ~/.bashrc
RUN echo 'alias ll="ls --color=auto -l"' >> ~/.bashrc