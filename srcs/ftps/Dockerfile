FROM	alpine:latest

RUN 	apk update && apk upgrade
RUN	apk add vsftpd openssl

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=arannara' \
        -keyout /etc/ssl/private/vsftpd.key \
        -out /etc/ssl/certs/vsftpd.crt

RUN     mkdir -p /var/lib/ftp

RUN     adduser -D -h /var/lib/ftp arannara; echo "arannara:qwerty" | chpasswd

COPY    /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY    /srcs/start.sh .

RUN     chmod 711 start.sh

EXPOSE  21 20021
VOLUME  /var/lib/ftp
ENTRYPOINT sh start.sh