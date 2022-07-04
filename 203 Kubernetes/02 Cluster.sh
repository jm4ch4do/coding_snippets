"-------------------------------INFO--------------------------------"
# The kubectl command allows controlling the API Server in the Master

kubectl cluster-info   # basic info on the cluster
kubectl cluster-info dump  # a lot more info


"-------------------------------NODES--------------------------------"
kubectl get nodes  # shows list of nodes
kubectl get pods   # shows list of pods


"--------------------------NAMESPACES & PODS-------------------------"
# Namespaces are used to separate pods (new pods go to default namespace)
kubectl get namespaces  # show list of namespaces
kubectl get pods --namespace=kube-system  # shows internal containers used by docker
                                          # which are stored in the kube-system namespace

# new pod which a docker image from dockerhub
kubectl run nginx --image=nginx

# details on pod including the IP address
kubectl describe pod nginx


"---------------------------------ALIAS--------------------------------"
alias k="kubectl"  # replacing the long command kubectl by k (temporary alias)