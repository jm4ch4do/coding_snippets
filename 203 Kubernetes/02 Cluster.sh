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
kubectl get pods -o wide  # list of pods with ip addresses

# new pod which a docker image from dockerhub
kubectl run nginx --image=nginx

# details on pod including the IP address
kubectl describe pod nginx


"---------------------------------ALIAS--------------------------------"
alias k="kubectl"  # replacing the long command kubectl by k (temporary alias)


"-------------------------------DEPLOYMENT-----------------------------"
# deployments are used to have replicas of the same pod
# inside the deployment you can create a Replica Set
# where you can place any number of pods to be replicated as a unit

# commands for new deployment, see all, view details, delete
k create deployment nginx-deployment --image=nginx 
k get deployments
k describe deployment nginx-deployment
k delete deployment nginx-deployment


# number of replicas
k scale deployment nginx-deployment --replicas=5  # increase to 5
k scale deployment nginx-deployment --replicas=3  # decrease to 3


"-------------------------------SERVICES-----------------------------"
# Inside a deployment you have replicas of pods with different IPs
# a Service provides a unique IP for balancing traffic to all replicas within the deployment

# exposing internal 80 port to external 8080
# a new IP is created for the new service
# The created deployment has type=ClusterIP which means
# is accesible to the cluster with a single IP
# this type is common for databases which need to be accesible only from inside the cluster
k expose deployment nginx-deployment --port=8080  --target-port=80

# list of services, details, delete
k get services
k describe service nginx-deployment
k delete service nginx-deployment