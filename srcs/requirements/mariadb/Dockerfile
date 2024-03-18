FROM    alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr
RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client mariadb-server-utils gettext

COPY ./conf/start.sh /start.sh
COPY ./conf/init.sql /init.sql
EXPOSE 3306
ENTRYPOINT ["sh", "/start.sh"]