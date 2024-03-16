FROM    alpine:3.19.1
MAINTAINER ggualerz@student.42nice.fr

RUN apk update && apk upgrade && apk add --no-cache wget
RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 -O ./cadvisor
RUN chmod +x cadvisor

ENTRYPOINT ["./cadvisor"]