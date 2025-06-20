# ----------------------------------------- NETWORK POLICY -----------------------------------------------
# A Network Policy is similar to a firewall rule that limits communication in or out of one pod.
# By default, all pods can communicate with each other if there are no network policies set.
# But once you set the first policy, rest of traffic is denied.

# Namespace-scoped: Policies apply only to pods in the same namespace.
# Label-based: Both selectors (for pods) and rules (for access control) are based on labels.



# -------------------------------------------- EXAMPLES --------------------------------------------------
# Example: Isolate pods having databases
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-pod
  namespace: default  # all pods go to the default namespace unless specified otherwise
spec:
  podSelector:
    matchLabels:
        role: db
  policyTypes:
  - Ingress
  - Egress

  
# Example: Allow front to backend communication
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-frontend-to-backend
  namespace: my-namespace
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: frontend
