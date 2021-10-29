FROM    alpine:3.12

ARG     MINIKUBE_IP

RUN	    apk update && apk upgrade

COPY    telegraf-1.14.3-r0.apk /

RUN     apk add --allow-untrusted telegraf-1.14.3-r0.apk

# RUN 	apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing telegraf

RUN     mkdir -p /etc/telegraf/

COPY    ./telegraf.conf /etc/telegraf/telegraf.conf

RUN     sed -i "s/MINIKUBE_IP/$MINIKUBE_IP/g" /etc/telegraf/telegraf.conf

VOLUME  /var/run/docker.sock

ENTRYPOINT telegraf --config /etc/telegraf/telegraf.conf