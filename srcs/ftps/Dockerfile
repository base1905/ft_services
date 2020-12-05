FROM	alpine:latest

RUN 	apk update && \
        apk add openrc 

RUN	apk add vsftpd && \
        apk add openssl

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=arannara' \
        -keyout /etc/ssl/private/vsftpd.key \
        -out /etc/ssl/certs/vsftpd.crt

RUN     adduser -D -h /var/ftp arannara; echo "arannara:qwerty" | chpasswd

RUN     mkdir -p /var/ftp

COPY    /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN     chmod 757 -R /var/lib/ftp

VOLUME  /var/lib/ftp

EXPOSE  21 20021

ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf