# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arannara <arannara@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/12 15:42:32 by arannara          #+#    #+#              #
#    Updated: 2020/12/04 23:51:24 by arannara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN 	apk update && apk upgrade

RUN		apk add openrc nginx supervisor php7 php7-fpm php7-mysqli php7-zlib \
		php7-curl php7-mbstring php7-json php7-session
		
RUN		mkdir www

RUN		mkdir -p /run/nginx && chmod 744 /run/nginx && chown -R nginx:nginx /run/nginx



RUN 	wget https://wordpress.org/latest.zip && unzip latest.zip && \
		mv wordpress /www/ && rm latest.zip

RUN		chmod 777 /www/wordpress/wp-content && chown -R nginx:nginx /www/wordpress/wp-content

COPY 	./srcs/nginx.conf /etc/nginx/conf.d/default.conf

COPY 	./srcs/supervisord.conf /etc/supervisord.conf

COPY 	./srcs/start.sh start.sh

COPY	./srcs/wp-config.php /www/

COPY	./srcs/textwp.1.0.1.zip /www/wordpress/wp-content/themes

RUN		cd /www/wordpress/wp-content/themes/ && unzip textwp.1.0.1.zip 

RUN 	chmod 711 start.sh

VOLUME	/var/www/localhost/htdocs

EXPOSE	5050

CMD		[ "sh", "start.sh" ]
