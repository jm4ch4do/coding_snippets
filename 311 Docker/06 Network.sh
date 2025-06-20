# --------------------------------------- BASIC NETWORKING --------------------------------------
# view
docker network ls                 # list networks
docker network inspect	my-network  # Display detailed information on a host or network

# connect
docker run -it --network my-network nicolaka/netshoot
docker network connect net1 vm1	  # Connect a container to a network
docker network disconnect <network-name> <container-name>

# create/remove
docker network create my-network  # create docker network (defaults to bridge and 172.17.0.1)
docker network rm my-network      # remove network
docker network create \           # specifies driver and subnet
    --network bridge \            # internal DNS always runs in the address 172.17.0.11
    --subnet 182.18.0.0/16        # (only for user define networks)
    my-new-network

# network alias
docker network create my-network  # network aliases are only available in user-defined networks
docker run -d --name my-container --network my-network --network-alias my-alias nginx  # alias
docker run -it --rm --network my-network busybox ping my-alias  # pings alias inside network
                                  # --rm indicates the container will be removed after usage
                                  # alias is adding a new entry in the DNS besides the name of container

# legacy for default brigde network for alias is to define alias within host
docker container run -dt --link container1:my-alias --name container2 busybox sh


# -------------------------------------------- DRIVERS ------------------------------------------
# BRIDGE: internal network with default gateway is 172.17.0.1 and containers get .2, .3 and so on
#         you can map ports from the host machine to any container in this network.
#         containers can communicate with each other

# BRIDGE: (USER DEFINED) Has a DNS running at ip .11. Provides better network isolation and network aliases.


# HOST:    every container uses your own ip address. There is only one host network that cannot be deleted.
#          ports from containers are automatically mapped to your machine
#          you cannot have several containers working with the same port.
#          used to monitor network since interface is shared with host (vpn, firewall, monitoring)

# NONE:    Disables networking entirely
# OVERLAY: Used for multi-host networking (Docker Swarm)
# MACVLAN: Assigns a MAC address to each container, appearing as a physical device in the network
# IPVLAN   Similar to Macvlan, but more advanced control over L2/L3.


# -------------------------------------------- EXAMPLE ------------------------------------------
# SQL DATABASE INSIDE NETWORK
docker run -d \
    --network todo-app --network-alias mysql \  # new container is known as mysql inside the network
    -v todo-mysql-data:/var/lib/mysql \  # sql data is stored in local folder
    -e MYSQL_ROOT_PASSWORD=secret \   # setting environment variable for root_password
    -e MYSQL_DATABASE=todos \  # set environment variable for database_name
    mysql:5.7  # this specific mysql container allows certain environment variables
docker exec -it e384a21b6d7d mysql -p  # opens mysql inside the container
