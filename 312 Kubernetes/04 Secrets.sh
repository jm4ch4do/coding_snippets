# ------------------------------------------ SECRETS ----------------------------------------------
# Kubernetes provides a central secret store for credentials

# generate from literal value and from file
kubectl create secret generic firstsecret --from-literal=dbpassword=mypassword123
kubectl create secret generic secondsecret --from-file=./credentials.txt

# view
kubectl get secret                              # view all secrets
kubectl get secret firstsecret -o yaml          # view details of one secret

# example yaml
apiVersion: v1
kind: Secret
metadata:
  name: thirdsecret
type: Opaque
data:
  username: ZGJhZG1pbg==
  password: bXlwYXNzd29yZDEyMw==


# ---------- MOUNTING SECRETS IN VOLUMES ----------
kubectl apply -f secretpod.yaml
kubectl exec it secretmount bash
> ls /etc/foo    # shows "dbpass"

# yaml
apiVersion: v1
kind: Pod
metadata:
  name: secretmount
spec:
  containers:
  - name: secretmount
    image: nginx
    volumeMounts:
    - name: foo
      mountPath: "/etc/foo"
      readOnly: true
  volumes:
    - name: foo
      secret:
        secretName: firstsecret


# ---------- MOUNTING SECRETS IN VARIABLES ----------
kubectl apply -f secret-env.yaml
kubectl exec it secretmount bash
echo $SECRET_USERNAME

# yaml
apiVersion: v1
kind: Pod
metadata:
  name: secret-env
spec:
  containers:
  - name: secret-env
    image: nginx
    env:
      - name: SECRET_USERNAME
        valueFrom:
          secretKeyRef:
            name: firstsecret
            key: dbpass
    restartPolicy: Never


# ---------------------------------------- CONFIG MAPS --------------------------------------------
# config maps objects are used similarly to secrets but they don't store sensitive information
# multiple variables can be stored in the same configmap

# create (from literal, file or folder)
kubectl create configmap dev-config --from-literal=app.mem=2048m   # add from literal
kubectl create configmap my-config --from-file=dev.prop            # add from file
dev.properties                        my_config.env
  app.env=dev                           ENV=prod
  app.mem=2048m                         DEBUG=false
  app.properties=dev.env.url            PORT=8080

# view
kubectl get configmap                       # shows stored configmaps
kubectl get configmap <mymap> -o yaml       # see a given configmap


# ---------- EXPOSE AS VOLUME ----------
apiVersion: v1
kind: Pod
metadata:
  name: configmap-pod
spec:
  containers:
    - name: test-container
      image: nginx
      volumeMounts:
      - name: config-volume
        mountPath: /etc/config
  volumes:
    - name: config-volume
      configMap:
        name: dev-properties
  restartPolicy: Never

# use secret inside container
kubectl apply -f pod-configmap.yaml
kubectl get pods
kubectl exec -it configmap-pod bash
> cat /etc/config/dev.properties


# --------- EXPOSE AS ENV VAR ----------
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: mycontainer
    image: nginx
    envFrom:
    - configMapRef:
        name: my_config.env

