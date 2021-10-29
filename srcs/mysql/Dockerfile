FROM    alpine:3.12

RUN 	apk update && apk upgrade

RUN		apk add openrc mysql mysql-client && \
		mkdir /run/mysqld && chown -R mysql /run/mysqld

COPY	./srcs/createdb.sql ./
COPY	./srcs/arannara.sql ./
COPY	./srcs/start.sh ./

COPY	./srcs/my.cnf /etc/my.cnf

EXPOSE	3306

ENTRYPOINT sh start.sh