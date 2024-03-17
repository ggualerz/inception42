FROM alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr

RUN apk update && apk upgrade && apk add --no-cache redis
RUN echo "maxmemory 256mb" >> /etc/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf
RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis.conf
EXPOSE 6379
ENTRYPOINT ["redis-server",  "--protected-mode", "no"]