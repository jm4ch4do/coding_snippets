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
# you only need to specify --target-port if it's different from the --port
k expose deployment nginx-deployment --port=8080  --target-port=80

# This type is visible from the outside of the cluster 
# it will assign a random external port to match the 3000 internal port
k expose deployment k8s-web-hello --type=NodePort  --port=3000

# Load Balancer allows you to set the IP you want to use
k expose deployment k8s-web-hello --type=LoadBalancer  --port=3000


# list of services, details, delete
k get services
k describe service nginx-deployment
k delete service nginx-deployment

"-------------------------------SERVICES-----------------------------"