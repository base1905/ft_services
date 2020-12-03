FROM	alpine:latest

RUN		apk update && apk add openrc \
		nginx supervisor \
		php7-fpm phpmyadmin

RUN		mkdir -p /www/
RUN		mkdir -p /www/phpmyadmin


COPY	./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	./srcs/config.inc.php /www/phpmyadmin/
COPY	./srcs/supervisord.conf /etc/supervisord.conf
COPY	./srcs/start.sh .
RUN		chmod 711 start.sh

EXPOSE	5000

CMD		[ "sh", "start.sh" ]
