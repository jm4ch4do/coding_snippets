"-------------------------------INFO--------------------------------"
# The kubectl command allows controlling the API Server in the Master

kubectl cluster-info   # basic info on the cluster
kubectl cluster-info dump  # a lot more info


"-------------------------------NODES--------------------------------"
kubectl get nodes  # shows list of nodes
kubectl get pods   # shows list of pods


"-----------------------------NAMESPACES-----------------------------"
# Namespaces are used to separate pods
kubectl get namespaces  # show list of namespaces
kubectl get pods --namespace=kube-system  # shows internal containers used by docker




