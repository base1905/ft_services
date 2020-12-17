# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arannara <arannara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/12 15:42:32 by arannara          #+#    #+#              #
#    Updated: 2020/11/25 17:35:31 by arannara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN 	apk update && apk add openrc 

RUN		apk add nginx && apk add supervisor

RUN		apk add openssl && apk add openssh

RUN		adduser -D 'arannara'; echo "arannara:qwerty" | chpasswd;

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=arannara' \
		-keyout /etc/ssl/localhost.key \
		-out /etc/ssl/localhost.crt

RUN		mkdir www

COPY	./srcs/index.html /www/

COPY 	./srcs/nginx.conf /etc/nginx/conf.d/default.conf

COPY 	./srcs/supervisord.conf /etc/supervisord.conf

COPY 	./srcs/start.sh start.sh

RUN 	chmod 711 start.sh

EXPOSE	80 443 22

CMD		[ "sh", "start.sh" ]
