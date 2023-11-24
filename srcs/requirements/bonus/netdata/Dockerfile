FROM	alpine:3.18.4

RUN		apk update; apk add wget; rm -rf /var/cache/apk/*;

RUN wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh;\
	sh /tmp/netdata-kickstart.sh --non-interactive

ENTRYPOINT ["/opt/netdata/bin/netdata", "-D"]