FROM alpine:3.18.4

RUN apk update; apk upgrade; apk add --no-cache nginx openssl

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

COPY tools/config_nginx.sh /usr/local/bin/config_nginx

ENTRYPOINT [ "config_nginx" ]