"--------------------------------BASIC---------------------------------"
# Kubernetes is shorted to K8S because you have 8 letters between k and s
# Automatic Deployment, load balancing, auto-scaling, monitoring, replacement
# K8s supports Docker, CRI-O, containerd


"--------------------------------POD---------------------------------"
# POD is the smallest unit in K8s
# a POD has containers, shared volumes and shared IP address
# One container per POD is the most common use case
# One POD is always tied to one server

"--------------------------------CLUSTER---------------------------------"
# A Kubernetes cluster is composed of different Nodes (either physical or virtual servers)
# The Master node is the control plane since it manages the worker nodes distributed load
# Applications always run in the worker nodes
# Master Node - Worker Node
#             - Worker Node

# The Master Node has the Scheduler service 
# also the Kube Controller Manager and Cloud Controller Manager
# and the etcd service that stores the logs
# also has a DNS service

# Every Worker uses the kubelet service to communicate with the API Server in the Master Node
# Every Worker also has a kube-proxy which is responsible for network communication
