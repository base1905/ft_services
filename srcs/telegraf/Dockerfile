FROM	alpine:latest

RUN	apk update && apk upgrade

ARG     MINIKUBE_IP

WORKDIR /srcs

RUN     apk add telegraf --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/

#ADD     https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz /etc/

#RUN     tar -xzf /etc/telegraf-1.16.3_linux_amd64.tar.gz -C /etc/ ; rm -rf /etc/telegraf-1.16.3_linux_amd64.tar.gz && \
#        mv /etc/telegraf-1.16.3 /telegraf && \
#        cp -r telegraf/* / && rm -rf /telegraf

#RUN     wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
#        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
#        apk add glibc-2.28-r0.apk

#RUN     telegraf -sample-config telegraf.conf --input-filter cpu:mem --output-filter influxdb > telegraf.conf


COPY    ./telegraf.conf /etc/telegraf.conf

RUN     sed -i "s/MINIKUBE_IP/$MINIKUBE_IP/g" /etc/telegraf.conf

VOLUME  /var/run/docker.sock

ENTRYPOINT telegraf --config /etc/telegraf.conf