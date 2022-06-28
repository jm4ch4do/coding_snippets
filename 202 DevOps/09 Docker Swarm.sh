"------------------------BASIC-------------------------"
# Docker Swarm allows you control several Docker host forming 
# a cluster with high availability and load balance
# It also allows to scale your application when growing and scale back when necessary


"------------------------DOCKER SWARM-------------------------"
# is the native Docker solution for clustering, is easy to learn but lacks advance features
# Kubernetes in the other hand, is a feature rich and 
# very popular solution but is more difficult to learn


"------------------------SWARM MANAGER-------------------------"
# One of the host in the cluster is the Swarm Manager (Master)
# And the others are Workers (Slaves)

docker swarm init  # start the master of the swarm cluster
docker swarm join --token <token>  # slave (worker or node) joins the cluster


# instead of a Docker Engine we have a Docker Swarm Orchestrator



"---------------------WEB SERVER WITH COPIES---------------------"
# these commands are to be run in the master
docker run my-web-server
docker service create --replicas=3 my-web-server  # three extra copies of the server




