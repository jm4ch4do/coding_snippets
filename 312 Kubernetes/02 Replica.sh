# ---------------------------------------- REPLICA SET --------------------------------------------
# kubernetes will guarantee that the desired state set in the replica set is always maintained
# Replica sets are rarely used directly and instead are used through a deployment object
kubectl apply -f replicaset.yaml                 # replica set are usually defined in yaml files
kubectl get replicaset                           # shows list of created replicasets


# --------------------------------------- YAML EXAMPLE --------------------------------------------
# create 5 replicas of nginx
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: kplabs-replicaset
spec:
  replicas: 5
  selector:                                       # all pods with label "tier: frontend" will be 
    matchLabels:                                  # considered as part of this replicaset
      tier: frontend                              
  template:                                       # a template is a blueprint of the objects to be created
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: nginx