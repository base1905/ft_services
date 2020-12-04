FROM	alpine:latest

RUN 	apk update && \
		apk add openrc 

RUN		apk add mysql mysql-client && \
		mkdir "/run/mysqld" && \
		chown -R mysql /run/mysqld

COPY	./srcs/createdb.sql \
		# ./srcs/arannara.sql \
		./srcs/start.sh ./

COPY	./srcs/my.cnf /etc/my.cnf

EXPOSE	3306

CMD		[ "sh", "start.sh" ]