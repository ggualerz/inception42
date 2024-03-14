FROM    alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr
RUN apk update && apk upgrade && apk add --no-cache nginx mariadb mariadb-client mariadb-server-utils
COPY ./conf/start.sh /start.sh

EXPOSE 3306
CMD ["sh", "/start.sh"]