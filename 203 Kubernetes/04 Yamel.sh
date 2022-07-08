"----------------------------IMPERATIVE/DECLARATIVE-----------------------"
# Imperative approach is deploying images like we did before by first 
# creating the image and later pulling it from DockerHub. You repeat the
# process for every image
# Declarative approach is more often used and consist on creating the
# deployment from .yml files where you can specify the whole
# configuration in a single file

# step 1. Create deployment.yaml and service.yaml files
# extra info on .yaml files config: 
# https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/deployment-v1/


# step 2. Make deployment
kubectl apply -f deployment.yaml
