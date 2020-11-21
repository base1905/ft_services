FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssl

# Ssl
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj \
"/C=RU/ST=Moscow/L=Moscow/O=arannara/CN=localhost" -keyout \
/etc/ssl/private/arannara.key -out /etc/ssl/certs/arannara.crt

# Nginx
COPY ./srcs/config_nginx /etc/nginx/conf.d/default.conf


COPY ./srcs/start_server.sh /tmp/
RUN chmod +x /tmp/start_server.sh 
RUN mkdir -p /run/nginx 
EXPOSE 80 443

# Run
CMD ["/tmp/start_server.sh"]