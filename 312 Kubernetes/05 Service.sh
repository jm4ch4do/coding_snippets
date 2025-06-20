# ------------------------------------------ SERVICE ----------------------------------------------
# In docker Swarm the service deploys the replicas and also handles load balancing.
# In Kubernetes, the Deployment deploys the replicas and the service handles load balancing.
# So, you have to create the service apart from the deployment.
# The Endpoints of the service are the Pods to which the traffic is balanced.


# ------------------------------ SERVICE WITH PODS (CLUSTER-IP) -----------------------------------
# simple case of associating a service with manually created pods
# Cluster IP is the default type of service and exposes the service internally in the cluster only

# create and label two backend pods
kubectl run backend-pod-1 --image=nginx
kubectl run backend-pod-2 --image=nginx
kubectl label pod backend-pod-1 app=backend
kubectl label pod backend-pod-2 app=backend

# create service
> service.yaml
apiVersion: v1
kind: Service
metadata:
   name: simple-service
spec:
   selector:
     app: backend
   ports:
   - port: 80
     targetPort: 80

kubectl create -f service.yaml

# verification
kubectl describe service simple-service     
kubectl label pod backend-pod-1 app-            # by removing label, pod gets removed from cluster
kubectl describe service simple-service


# ------------------------------------ SERVICE NODE-PORT -----------------------------------------
# Node Port type of service: exposes the service on a static port on each node
# useful for basic testing or basic external access
# you'll be able to access the service, from outside the cluster, by requesting to <WorkerIP>:<NodePort>

# service manifest
> service.yaml
apiVersion: v1
kind: Service
metadata:
   name: nodeport-service
spec:
   selector:
     app: backend
   type: NodePort
   ports:
   - port: 80
     targetPort: 80
     nodePort: 30080  # optional; if omitted, Kubernetes assigns one

kubectl create -f service.yaml

# create and label pod
kubectl run backend-pod --image=nginx
kubectl label pod backend-pod app=backend
kubectl describe service nodeport-service

# test request
kubectl get nodes -o wide
curl <IP:30080>









