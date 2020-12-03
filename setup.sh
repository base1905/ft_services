minikube start --vm-driver=virtualbox

minikube dashboard &

eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f ./srcs/nginx/metallb.yaml

# NGINX
docker build -t nginx ./srcs/nginx/
kubectl apply -f ./srcs/nginx/

# MYSQL
docker build -t mysql ./srcs/mysql/
kubectl apply -f ./srcs/mysql/

#FTPS
docker build -t ftps ./srcs/ftps/
kubectl apply -f ./srcs/ftps/

docker build -t phpmyadmin ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin/

# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd