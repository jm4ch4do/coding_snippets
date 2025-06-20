# ---------------------------------------- ORCHESTRATION ------------------------------------------
# Container Orchestration tools: Docker Swarm, Kubernetes, Amazon ECS. They provide:
# 1. Provisioning and Deployment. 2. Configuration and Scheduling.
# 3. Resource Allocation          4. Load Balancing and traffic routing


# ---------------------------------------- DOCKER SWARM -------------------------------------------
# Docker Swarm is the Orchestration solution natively supported by docker with limited features.
# Node:         physical machine or vm  part of the swarm cluster.
# Manager Node: controls the swarm. Follows instructions in the service definition.
# Worker Node:  performs tasks as instructed by manager. Can run one multiple replicas.

# Service:      set of instructions to run       (deploy 3 nginx servers)
# Task:         one instance of the instructions (task1 is deploy server1)
# Replica:      the result of the Task           (container1 was deployed and is running nginx)


# ------------------------------------------- SYSTEM ----------------------------------------------
docker system df                                   # show docker disk usage
docker system events                               # get real time events from the server
docker system info                                 # display system-wide information
docker system prune                                # remove unused data


# ---------------------------------------- SWARM CLUSTER ------------------------------------------
# manager
docker swarm init --advertise-addr 104.248.48.163  # create manager in host1 (get token as output)
docker swarm join-token manager                    # retrieves token for adding new managers
docker swarm join-token worker                     # retrieves token for adding new workers
docker swarm leave --force                         # destroys swarm after deleting last manager node

# worker
docker swarm join --token <token> 104.8.4.3:2377   # joins host2 to join swarm using token
docker swarm leave               

# security
docker swarm update --autolock=true                # locks the cluster (provides key)
systemctl restart docker                           # restart for lock to take effect
docker node ls                                     # forbidden until you unlock
docker swarm unlock                                # will prompt for key to unlock swarm
docker swarm unlock-key --rotate                   # will change the key


# -------------------------------------------- NODE -----------------------------------------------
docker node ls                                     # shows nodes in the swarm
docker info | grep Manager                         # shows if node is manager of a swarm
docker node ps                                     # shows tasks running in current node
docker node ps swarm02                             # shows tasks running in remote node 
docker node promote swarm02                        # promotes remote to manager
docker node demote swarm02                         # demotes from remote node from manager status
docker node inspect swarm02 --pretty               # shows details of node
docker node rm swarm02                             # removes one node from the swarm
docker node update --availability drain swarm02    # moves container away from this node (managers are usually drained in large clusters of +7)
docker node update --availability active swarm02   # re-enables node 


# ------------------------------------------- SERVICE ---------------------------------------------
# create
docker service create --name web1 --replicas 1 nginx  # create service
docker service create --name antivirus --mode global -dt ubuntu  # launches task in every node
docker service create --name web1 --replicas 2 --publish 8080:80 nginx  # exposes port in every node


# view, remove
docker service rm web1                        # removes service
docker service ls                             # see services
docker service ps webs1                       # show tasks for service webs1 

# scale
docker service scale web1=5 web2=3            # upscale one service to 5 replicas and another to 3
docker service scale web1=1                   # downscale service to 1 replica
docker service update --replicas 5 web1       # upscale using "update" instead (single service at the time)

# constraints
docker node update --label-add region=mumbai <node-id>  # add label to a node for a given region
docker service create --name myserv --constraint \      # only deploys on specified region
  node.labels.region==mumbai --replicas 3 nginx  

# template (can use for --hostname, --mount or --env)
docker service create --name demoservice --hostname="{{.Node.Hostname}}-{{.Service.Name}}" nginx


# -------------------------------------------- STACK ----------------------------------------------
# Used to handle multi-service application through a docker compose file
# A docker stack creates the neccesary services for you

# deploy
docker stack deploy --compose-file docker-compose.yml mydemo  

# view
docker stack ls         # shows all stacks
docker stack ps mydemo  # shows containers deployed as part of stack 'mydemo' 


# ------------------------------------------- VOLUMES ---------------------------------------------
docker volume ls   # shows volumes

# create a service with attached volumen
docker service create --name myservice --mount type=volume,source=myvolume,target=/mypath nginx
# VERY IMPORTANT: volumnes persist after the service has been deleted


# -------------------------------------- OVERLAY NETWORKS -----------------------------------------
# is a network share between diffeernt nodes where containers will act as if they were in the same
# local network even though they may be in distant locations.
# By default, when you create a service it will be added to the default ingress network with type overlay

# custom overlay:
docker network create --driver overlay my_overlay
docker service create --name myapp --network my_overlay --replicas 3 nginx

# security
docker network create --opt encrypted ...            # info will be encrypted while travaling between nodes
# docker creates IPSEC tunnels between nodes
# tunnels use AES algo in GCM mode and rotate key every 12 hours
# not supported in Windows


# ------------------------------------------- QUORUM ----------------------------------------------
# Is recommended to have an odd number of nodes so if one goes down the other two will have quorum
# (majority) to select one of them as the new manager and avoid a split brain situation.
# Fault tolerance is given by the amount of nodes (N) required to maintain quorum. Tolerance = (N-1)/2
# For example, with 7 nodes, 3 may go down and you'll still have quorum with 4 nodes. So, fault tolerance is 3.

# Similarly, the Raft consensus algorithm is used by swarm MANAGERS were a majority of managers must agree to
# make a change in a cluster. One of the managers acts as the leader and is replaced if it goes down.

docker swarm init --force-new-cluster --advertise-addr 10.10.0.4  # forces creation of new manager if old one was lost