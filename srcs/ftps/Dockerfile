FROM alpine:latest

RUN apk update && apk upgrade

WORKDIR /srcs

RUN apk add vsftpd openssl

RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
    "/C=RU/ST=Moscow/L=Moscow/O=arannara/CN=localhost" -keyout \
    /etc/ssl/private/arannara.key -out /etc/ssl/certs/arannara.crt

RUN     adduser -D -h /var/ftp arannara; echo "arannara:qwerty" | chpasswd

RUN     mkdir -p /var/ftp

COPY    /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY    /srcs/start.sh .

RUN     chmod 711 start.sh

EXPOSE  20 21 30000

CMD     [ "sh", "start.sh" ]