minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f metallb.yaml

# build nginx
docker build -t nginx .
# apply rule nginx
kubectl apply -f nginx.yaml

kubectl get svc

minikube dashboard


# kubectl exec deploy/nginx -- pkill nginx
# kubectl exec deploy/nginx -- pkill sshd