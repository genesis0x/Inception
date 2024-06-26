FROM alpine:3.15

ARG WORDPRESS_HOST

RUN apk update \
	&& apk add --no-cache \
	nginx \
	openssl \
	gettext \
	vim \
	&& rm -f /var/cache/apk/*

RUN openssl req -x509 -days 365 -nodes -newkey rsa -subj '/CN=localhost' \
	-keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt 2> /dev/null

WORKDIR /var/www
RUN adduser -D -g 'www' www \
	&& chown -R www:www . \
	&& chown -R www:www /var/lib/nginx
COPY tools/index.html /usr/share/nginx/

WORKDIR /etc/nginx
RUN mv nginx.conf nginx.conf.orig
COPY conf/nginx.conf .
COPY conf/default.conf.template http.d
RUN envsubst \
	'$WORDPRESS_HOST' \
	< http.d/default.conf.template > http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
