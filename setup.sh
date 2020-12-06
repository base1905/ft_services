minikube start --vm-driver=virtualbox

minikube dashboard &

eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f ./srcs/nginx/metallb.yaml

#NGINX
docker build -t nginx ./srcs/nginx/
kubectl apply -f ./srcs/nginx/

#MYSQL
docker build -t mysql ./srcs/mysql/
kubectl apply -f ./srcs/mysql/

#FTPS
docker build -t ftps ./srcs/ftps/
kubectl apply -f ./srcs/ftps/

#PHPMYADMIN
docker build -t phpmyadmin ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin/

#WORDPRESS
docker build -t wordpress ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/

#INFLUXDB
docker build -t influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/

#TELEGRAF
docker build -t telegraf ./srcs/telegraf
kubectl apply -f ./srcs/telegraf/

#GRAFANA
docker build -t grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana/


# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana
# kubectl exec deploy/telegraf -- pkill telegraf
# kubectl exec deploy/influxdb -- pkill influx
# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/wordpress -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill php-fpm7
# kubectl exec deploy/mysql -- pkill /usr/bin/mysqld 
# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill ssh