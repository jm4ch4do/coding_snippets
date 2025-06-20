# ------------------------------------------- INTRO -----------------------------------------------
# Kubernetes is shorted to K8S because you have 8 letters between k and s
# Automatic Deployment, load balancing, auto-scaling, monitoring, replacement
# K8s supports Docker, CRI-O, containerd


# ----------------------------------------- COMPONENTS --------------------------------------------
# kubectl: client side
#
# Control Plane: set of components that manage and orchestrate the entire cluster
#     - kube-apiserver: exposes api handling REST operations
#     - etcd: stores configuration state, secrets and metadata.
#     - kube-scheduler: assigns resources to nodes based on requirements and policies
#     - kube-controller-manager: runs varios background loops that assure desired states
#     - cloud-controller-manager: integrates with cloud-specific APIs(AWS, Azure...)
# *control plane is self-managed in many of the cloud offers
#
# Worker Node Agents: they run the containers and communicate with the control plane
#     - kubelet: primary agent that runs on every node, communicates with api and checks healths of pods.
#     - kube-proxy: handles networking on the node.
#     - container runtime: software that actually runs containers 


# POD: a pod is a group of one or more containers with shared resources
# Kubernetes Objects: is the technical term for record of intent which is the request you sent to kubernetes
#                     that contains the changes the state you wanted to achive. Kubernetes will make the
#                     required actions to achieve this state.
# Common Objects: Pod, Deployment, Service, ReplicaSet, Job, Secret, Ingress, Namespaces, Daemonsets ...


# --------------------------------------- BASIC COMMANDS ------------------------------------------
# commands have a very similar structure to docker commands
kubectl run web1 --image=nginx                    # creates nginx container (no need for -d like in docker)
kubectl get nodes
kubectl get pods -o wide                          # more info
kubectl get pods                                  
kubectl exec -it web1 -- bash
kubectl delete pod web1                           # deletes pod (no need to stop first like in docker)

kubectl apply -f newpod.yaml                      # executes yaml with instruction (common way to provide instructions)
kubectl run nginx2 --image=nginx --dry-run=client -o yaml  # converts instructions to yaml (view example below)


# ------------------------------------------- LABELS ----------------------------------------------
# a label can have any key-value pair and can be assigned to any object
# In the yaml file, labels are stored in the metadata section within the target object (like Pods)
kubectl label pod web1 env=prd                       # assigns label env with value prd to pod web1
kubectl label pods --all status=unhealthy                  # label all pods at once
kubectl get pods -l env=prd   # or env!=prd          # filters only the pods with prd environment
kubectl get pods --show-labels                       # show labels for all pods
kubectl get pod web1 --show-labels                   # shows labels for specific pod
kubectl describe pod web1                            # shows lots of details about pod including labels


# ---------------------------------------- YAML EXAMPLE -------------------------------------------
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx2
  name: nginx2
spec:
  containers:
  - image: nginx
    name: nginx2
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}