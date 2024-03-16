FROM    alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr
RUN apk update && apk upgrade && apk add --no-cache wget php82  php82-mysqli php82-session
RUN mkdir /var/www
RUN mkdir /var/www/html
RUN wget https://www.adminer.org/latest-mysql-en.php -O /var/www/html/index.php
RUN chmod 777 /var/www/html/index.php
EXPOSE 80
WORKDIR /var/www/html
ENTRYPOINT ["php", "-S", "0.0.0.0:80"]