MAINTAINER ggualerz@student.42nice.fr
FROM    alpine:3.19.1
RUN     apk update && apk upgrade && apk add --no-cache nginx gettext



WORKDIR /var/www/html
COPY    ./conf/start.sh /start.sh
RUN     chmod +x /start.sh
COPY    ./conf/default.template /etc/nginx/http.d/default.template

EXPOSE  443

# CMD     ["sh", "/start.sh"]
CMD ["sh", "nginx -g 'daemon off;'"]