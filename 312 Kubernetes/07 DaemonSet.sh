# -------------------------------------------- DAEMON SET ------------------------------------------------
# Allows to run a pod in every single node. When using replicaset, is not guaranteed that all nodes will
# be used, there may be 2 pods deployed in the same node and one empty node.

kubectl get daemonset

# Example
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: kplabs-daemonset
spec:
  selector:
    matchLabels:
      name: kplabs-all-pods
  template:
    metadata:
      labels:
        name: kplabs-all-pods
    spec:
      containers:
      - name: kplabs-pods
        image: nginx