FROM    alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr

RUN apk update && \
    apk upgrade && \
    apk add --no-cache nginx gettext php82 php82-fpm

RUN apk update && apk upgrade && apk add --no-cache \
    wget \
    tar \
    mariadb-client \
    redis \
    curl \
    php82-bcmath \
    php82-bz2 \
    php82-calendar \
    php82-ctype \
    php82-curl \
    php82-dom \
    php82-exif \
    php82-fileinfo \
    php82-gd \
    php82-gmp \
    php82-iconv \
    php82-imap \
    php82-intl \
    php82-json \
    php82-mbstring \
    php82-mysqli \
    php82-openssl \
    php82-pcntl \
    php82-pdo \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    php82-pdo_sqlite \
    php82-pgsql \
    php82-phar \
    php82-posix \
    php82-redis \
    php82-session \
    php82-shmop \
    php82-simplexml \
    php82-soap \
    php82-sockets \
    php82-sodium \
    php82-sqlite3 \
    php82-tokenizer \
    php82-xml \
    php82-xmlreader \
    php82-xmlwriter \
    php82-xsl \
    php82-zip \
    php82-zlib \
    gettext

# Used by FPM
RUN adduser -S wordpress-fpm && addgroup -S wordpress-fpm 

# Copy conf and add rights to it, 777 because im a lazy ass sysadmin
COPY    ./conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY    ./conf/wp-config.php /wp-config.php
COPY    ./conf/start.sh ./start.sh
RUN		chmod 777 ./start.sh
RUN		mkdir /var/www/html
RUN 	chmod 777 /var/www/html

# Downloading and changing permissions of WP CLI tool
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv -f wp-cli.phar /usr/local/bin/wp

# Using wp cli tool

ENTRYPOINT	["sh", "start.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
EXPOSE 9000
