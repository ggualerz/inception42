FROM    alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr

RUN apk update && \
    apk upgrade && \
    apk add --no-cache wget curl php82 php82-fpm mariadb-client php82-mysqli php82-phar php82-openssl php82-pdo_mysql php82-curl php82-json php82-dom php82-session php82-mbstring php82-simplexml php82-tokenizer php82-xml php82-xmlwriter php82-xmlreader php82-redis php82-ctype


# Install WP-CLI
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

# Used by FPM
RUN adduser -S wordpress-fpm && addgroup -S wordpress-fpm 

# Copy conf and add rights to it, 777 because im a lazy ass sysadmin
COPY    ./conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY    ./conf/wp-config.php /wp-config.php
COPY    ./conf/start.sh ./start.sh
RUN		chmod 777 ./start.sh
RUN		mkdir /var/www
RUN		mkdir /var/www/html
RUN 	chmod 777 /var/www/html

EXPOSE 9000
ENTRYPOINT	["sh", "start.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]

