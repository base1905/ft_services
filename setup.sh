minikube start --vm-driver=virtualbox

minikube dashboard &

minikube addons enable metallb
minikube addons enable metrics-server

kubectl apply -f ./srcs/configmap.yaml

kubectl create secret generic -n metallb-system memberlist \
    --from-literal=secretkey="$(openssl rand -base64 128)"

export MINIKUBE_IP=$(minikube ip)

eval $(minikube docker-env)

printf "\nNGINX..."
docker build -t nginx ./srcs/nginx > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-deploy/nginx-deploy.yaml
kubectl apply -f ./srcs/yaml-service/nginx-service.yaml

printf "\nMYSQL..."
docker build -t mysql ./srcs/mysql > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-volume/mysql-volume.yaml
kubectl apply -f ./srcs/yaml-deploy/mysql-deploy.yaml
kubectl apply -f ./srcs/yaml-service/mysql-service.yaml

printf "\nFTPS..."
docker build -t ftps ./srcs/ftps > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-volume/ftps-volume.yaml
kubectl apply -f ./srcs/yaml-deploy/ftps-deploy.yaml
kubectl apply -f ./srcs/yaml-service/ftps-service.yaml

printf "\nPHPMYADMIN..."
docker build -t phpmyadmin ./srcs/phpmyadmin > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-deploy/phpmyadmin-deploy.yaml
kubectl apply -f ./srcs/yaml-service/phpmyadmin-service.yaml

printf "\nWORDPRESS..."
docker build -t wordpress ./srcs/wordpress > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-deploy/wordpress-deploy.yaml
kubectl apply -f ./srcs/yaml-service/wordpress-service.yaml

printf "\nINFLUXDB..."
docker build -t influxdb ./srcs/influxdb > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-volume/influxdb-volume.yaml
kubectl apply -f ./srcs/yaml-deploy/influxdb-deploy.yaml
kubectl apply -f ./srcs/yaml-service/influxdb-service.yaml

printf "\nTELEGRAF..."
docker build --build-arg MINIKUBE_IP=${MINIKUBE_IP} -t telegraf ./srcs/telegraf > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-daemon/

printf "\nGRAFANA..."
docker build -t grafana ./srcs/grafana > /dev/null
echo "Ok"
kubectl apply -f ./srcs/yaml-deploy/grafana-deploy.yaml
kubectl apply -f ./srcs/yaml-service/grafana-service.yaml

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