FROM debian:buster

# Install php and stuff
RUN apt-get update && apt-get install -y \
        php7.3-fpm \
        php7.3-common \
        php7.3-dev \
        php7.3-intl \
        php7.3-mcrypt \
        php7.3-curl \
        php7.3-imagick \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i "s/listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000
ENTRYPOINT ["php7.3-fpm","-F"]
