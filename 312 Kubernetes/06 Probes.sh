# ------------------------------------------ LIVENESS PROBE ----------------------------------------------
# The goal is to detect when a service is done to proceed to restart.

# There are three types of Liveness probes: COMMAND, HTTP and TCP
# The Command probe runs a command and restarts if status is not 0
# this example will continuosly restart the vm because nginx is not installed and it will fail the test everytime.
apiVersion: v1
kind: Pod
metadata:
  name: liveness
spec:
  containers:
  - name: liveness
    image: ubuntu
    tty: true
    livenessProbe:
      exec:
        command:
        - service
        - nginx
        - status
      initialDelaySeconds: 20
      periodSeconds: 5

    # example of http type
    livenessProbe:
      httpGet:
        path: /
        port: 80

# ----------------------------------------- READINESS PROBE ----------------------------------------------
# This probe checks if the service is ready, for example for an antivirus the vm may be still downloading 
# updates. Hence, the service is not active but there is nothing broken. In this case kubernetes will not
# serve traffic until the server is ready but it will not try to restart.
apiVersion: v1
kind: Pod
metadata:
  name: readiness
spec:
  containers:
  - name: readiness
    image: ubuntu
    tty: true
    readinessProbe:
     exec:
       command:
       - cat
       - /tmp/healthy               # after downloading updates, the server must touch this file 
     initialDelaySeconds: 5         # to indicate to kubernetes that is ready
     periodSeconds: 5








