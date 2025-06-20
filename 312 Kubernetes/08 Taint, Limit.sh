# ---------------------------------------------- TAINT ---------------------------------------------------
# A taint marks a node as having a special condition preventing normal pods from being scheduled on it.
# If the pod has a matching toleration, then it may be able to schedule on a tainted node.

# Types of Taints
# NoSchedule: New pods will not be scheduled unless it tolerates the taint. Old pods stay
# PreferNoSchedule: Similar to previous, but now kubernetes will try to avoid but may
#                   end scheduling on the node if it finds no other alternative.
# NoExecute: Pods will be evicted if they don't have a toleration. Affects both new and old pods.

# taint/untaint a node
kubectl taint nodes node1 mykey=myvalue:NoSchedule
kubectl taint nodes node1 mykey=myvalue:NoSchedule-  # for untaint just add a -

# adding toleration in pod config
# we allow the pod to be schedule on any node with taint mykey:myvalue:NoSchedule
tolerations:
- key: "mykey"
  operator: "Equal"
  value: "value"
  effect: "NoSchedule"


# ---------------------------------------------- LIMIT ---------------------------------------------------
# A Request sets the minimun requirements a pod has of cpu and ram for finding a suitable node.
# A Limit sets the maximun consumption the pod can do and is used to protect nodes from overconsuming pods.

resources:
  requests:
    memory: "256Mi"
    cpu: "500m"
  limits:
    memory: "512Mi"
    cpu: "1"
    
# This means:
# A Node needs to have at least 256Mi memory and 0.5 CPU available for to run this container.
# At runtime, the container can burst up to 512Mi and 1 CPU. Exceeding memory limit will cause container termination.


# Full Example:
apiVersion: v1
kind: Pod
metadata:
  name: kplabs-pod
spec:
  containers:
  - name: kplabs-container
    image: nginx
    resources:
      requests:
        memory: "640Mi"
        cpu: "0.5"
      limits:
        memory: "12800Mi"
        cpu: "1"

