FROM alpine:3.18.4

RUN apk --no-cache add caddy; rm -rf /var/cache/apk/*

WORKDIR /var/www/html/

COPY tools/index.html /var/www/

EXPOSE 9000

CMD ["caddy", "file-server", "--listen", "0.0.0.0:9000"]