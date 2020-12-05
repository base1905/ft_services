FROM    alpine:latest

RUN     apk update && apk upgrade
RUN     apk add openrc nginx openssl openssh supervisor

RUN     mkdir /etc/nginx/ssl
RUN     openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
        "/C=RU/ST=Moscow/L=Moscow/O=arannara/CN=localhost" -keyout \
        /etc/ssl/private/arannara.key -out /etc/ssl/certs/arannara.crt

RUN     ssh-keygen -A
RUN     sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN     adduser -D arannara && echo "arannara:qwerty" | chpasswd && echo "root:qwerty" | chpasswd

COPY    ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN     mkdir -p /run/nginx 
RUN     mkdir -p /data/www
COPY    ./srcs/index.html /data/www

EXPOSE  22 80 443

COPY    ./srcs/supervisord.conf /etc/supervisord.conf

ENTRYPOINT  /usr/bin/supervisord -c /etc/supervisord.conf