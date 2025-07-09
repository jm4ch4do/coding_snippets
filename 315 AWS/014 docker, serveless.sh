# ------------------------------------------------ DOCKER --------------------------------------------
ECS (Elastic Container Service)       # Launch docker container on EC2. You must provision the infrastructure (EC2s)
                                      # Lightweight orchestrator like docker Swarm. Has integrations with Load Balancers and others.
Fargate                               # Serverless orchestrator. You don't need to provision infrastructure.

ECR (Elastic_Container_Registry)      # Private amazon docker repository where images need to be so they can be run by ECS or Fargate.

EKS (Elastic Kubernetes Service)      # Kubernetes on cloud. It can integrate either with ECS or Fargate(serverless).

# ---------------------------------------------- SERVERLESS ------------------------------------------
Lambda                                # serverless functions that are triggered by events. Paid per request and compute time.
                                      # Support Node, Python, Java, C#, Ruby and others.
                                      # Has a time limit, limited languages and limited temporary disk space.
                                      # Use case: Serverless Cron Jobs, execute script when uploading files to S3

API Gateway                           # Building a managed serveless API  (Client -> Api Gateway -> Lambda -> DynamoDB)

Batch                                 # Managed batch processing at scale. Batch services has start and end times 
                                      # for which the service accommodates EC2 or Spot instances. Can also run on ECS as docker images.
                                      # Is more expensive than lambda but has no time limit, no limited languages and EBS storage. Is not serveless.


# ----------------------------------------------- LIGHSAIL -------------------------------------------
Lightsail                             # Simpler alternative to EC2, RDS, ELB, EBS... Designed for people with little cloud experience.
                                      # Use cases: simple web application, CMS like Wordpress, Dev and Test environments.
                                      # Has high availability but no autoscaling and limited AWS integrations.


















