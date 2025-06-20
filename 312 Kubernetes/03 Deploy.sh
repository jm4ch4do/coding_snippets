# ---------------------------------------- DEPLOYMENTS --------------------------------------------
# a deployment provides extra feature on top of replicasets such as: rolling updates, rollbacks and versioning.
# when doing a deployment, a new replicaset is creaded while the old one is still in place
# once the new one is stable, the old one is deleted. 
# Similarly, a rollback to the old one can be made if new one has bugs


# ------------------------------------------ COMMANDS ---------------------------------------------
# create/delete
kubectl apply -f my-dep.yaml                              # recommended approach     
kubectl deployment demo-deployment --image=nginx --replicas 3
kubectl delete deployment demo-deployment

# scale
kubectl scale deployment nginx-deployment --replicas=5    # increase to 5
kubectl scale deployment nginx-deployment --replicas=3    # decrease to 3

# view
kubectl get deployments
kubectl describe deployments my-deployment                # has info on how changes happened
kubectl rollout history deployment.v1.apps/my-deployment  # views history of changes in deployment   
kubectl rollout history deployment.v1.apps/my-deployment --revision 1  # details of revision 1

# maxSurge: maximun number of pods that can be started above the original number of pods (default 25%)
# maxUnavailable: maximun number of pods that an be unavailable during the update (default 25%)










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




"-----------------------------DEPLOY UPDATE---------------------------"
# New deployments have by default StrategyType: RollingUpdate which 
# means than when you update the image in DockerHub it will create
# new images with the new updated version while the old ones keep 
# working with the old ones until the server is able to replace them all

# set new image for a given deploment
k set image deployment k8s-web-hello k8s-web-hello=m4ch4do/k8s-web-hello:2.0.0

# verify the status of the migration
k rollout status deploy k8s-web-hello 

# you can also roll back to the previous image
k set image deployment k8s-web-hello k8s-web-hello=m4ch4do/k8s-web-hello





# ---------------------------------------- EXAMPLE YAML -------------------------------------------
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kplabs-deployment
spec:
  replicas: 5
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: nginx