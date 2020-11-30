minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f ./srcs/nginx/metallb.yaml

# NGINX
docker build -t nginx ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx.yaml

# MYSQL
docker build -t mysql ./srcs/mysql/
kubectl apply -f ./srcs/mysql/mysql-volume.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml

minikube dashboard

# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd