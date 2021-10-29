FROM    alpine:3.12

RUN     apk update && apk upgrade

COPY    srcs/start.sh /

COPY    srcs/grafana-7.3.6-r0.apk /

RUN     apk add --allow-untrusted grafana-7.3.6-r0.apk

COPY    srcs/grafana.ini /usr/share/grafana/conf/custom.ini
COPY    srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY    srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb.yaml

RUN     mkdir -p /var/lib/grafana_dashboards/
COPY    srcs/dashboard.json /var/lib/grafana_dashboards/

EXPOSE  3000

ENTRYPOINT sh start.sh