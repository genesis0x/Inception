FROM	alpine:3.18.4

RUN		apk update; apk add wget php-fpm php-session php-mysqli php-odbc php-pgsql php-sqlite3; rm -rf /var/cache/apk/*;\
	    sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf;

COPY	tools/setup_adminer.sh /usr/local/bin/setup_adminer
RUN		chmod +x /usr/local/bin/setup_adminer

ENTRYPOINT ["setup_adminer"]