FROM	debian:bookworm-slim

RUN		apt update; apt install -y vsftpd; apt clean -y;
		
COPY	tools/setup_ftp.sh /usr/local/bin/setup_ftp
RUN		chmod +x /usr/local/bin/setup_ftp

ENTRYPOINT ["setup_ftp"]