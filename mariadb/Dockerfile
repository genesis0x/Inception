FROM alpine:3.18.4

RUN apk update; apk upgrade; apk add --no-cache mariadb

COPY tools/config_mariadb.sh /usr/local/bin/config_mariadb

ENTRYPOINT [ "config_mariadb" ]