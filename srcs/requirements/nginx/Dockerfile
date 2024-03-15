FROM    alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr

RUN     apk update && apk upgrade && apk add --no-cache nginx gettext



WORKDIR /var/www/html
COPY    ./conf/default.conf /etc/nginx/http.d/default.conf
COPY	./conf/srv.key /etc/nginx/ssl/srv.key
COPY	./conf/srv.crt /etc/nginx/ssl/srv.crt

EXPOSE  443
# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]

