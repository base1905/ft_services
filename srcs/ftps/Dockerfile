FROM alpine:latest

RUN apk update && apk upgrade

WORKDIR /srcs

RUN apk add vsftpd openssl

RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
    "/C=RU/ST=Moscow/L=Moscow/O=arannara/CN=localhost" -keyout \
    /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

RUN     adduser -D -h /var/ftp arannara; echo "arannara:qwerty" | chpasswd

RUN     mkdir -p /var/ftp

COPY    /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY    /srcs/start.sh .

VOLUME  /var/lib/ftp

RUN     chmod 711 start.sh

EXPOSE  21 30000

CMD     [ "sh", "start.sh" ]