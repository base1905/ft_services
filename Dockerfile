FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache openrc nginx openssl openssh supervisor

# Ssl
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
"/C=RU/ST=Moscow/L=Moscow/O=arannara/CN=localhost" -keyout \
/etc/ssl/private/arannara.key -out /etc/ssl/certs/arannara.crt

RUN	adduser -D 'arannara'; echo "arannara:qwerty" | chpasswd;

# Nginx
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx 

EXPOSE 80 443 22

# Supervisor
COPY 	./srcs/supervisord.conf /etc/supervisord.conf
COPY 	./srcs/start.sh start.sh

# Run
CMD	[ "sh", "start.sh" ]