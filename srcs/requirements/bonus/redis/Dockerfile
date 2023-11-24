FROM	alpine:3.18.4

RUN		apk update; apk add --no-cache redis; rm -rf /var/cache/apk/*

RUN		sed -i "s/bind 127.0.0.1/bind 0.0.0.0/" /etc/redis.conf;

ENTRYPOINT	["redis-server"]

CMD ["--protected-mode", "no"]
