"------------------------BASIC-------------------------"
# create/remove
docker network ls                 # list networks
docker network create my-network  # create docker network
docker network rm my-network      # remove network

# connect/disconnect
docker network connect	# Connect a container to a network
docker network disconnect	# Disconnect a container from a network
docker network inspect	my-network  # Display detailed information on a host or network

# start container inside a network
docker run -it --network my-network nicolaka/netshoot

# DNS SERVER
# The internal DNS server for Docker always runs in the address 172.17.0.11


"------------------------NEW NETWORK-------------------------"
docker network create \
    --driver bridge \
    --subnet 182.18.0.0/16
    my-new-network


"------------------------DRIVERS-------------------------"
# bridge:  internal network where usually docker is 172.17.0.1 
# and the others get .2, .3 and so on
# you can map ports from the host machine to any container in this network
docker run ubuntu  # is assigned by default to the Bridge Network


# host:    every container uses your own ip address
# now ports from ubuntu are automatically mapped to your machine
# now you cannot have several containers working with the same port
# since you don't have the mapping tool to switch to different ports in the localhost
docker run ubuntu --network=host  # assign to host network

# none:    containers are isolated having no access to any other container or network
docker run ubuntu --network=none  # assign to none network


# overlay: allows different networks to communicate
# macvlan: allows assigning macs to containers


"------------------------EXAMPLE-------------------------"
# SQL DATABASE INSIDE NETWORK
docker run -d \
    --network todo-app --network-alias mysql \  # new container is known as mysql inside the network
    -v todo-mysql-data:/var/lib/mysql \  # sql data is stored in local folder
    -e MYSQL_ROOT_PASSWORD=secret \   # setting environment variable for root_password
    -e MYSQL_DATABASE=todos \  # set environment variable for database_name
    mysql:5.7  # this specific mysql container allows certain environment variables
docker exec -it e384a21b6d7d mysql -p  # opens mysql inside the container


"------------------------BRIDGE EXAMPLE-------------------------"
# when you run a new container, it automatically gets assigned to the default docker
# network which is a bridge type
docker run --rm -d --name nginx -p 80:80 nginx
docker inspect nginx

# hosts in this network get their IP assigned by the docker DHCP server and they
# don't allow name resolution which makes this a bad scenario for deployment


"------------------------NETWORK TROUBLE SHOOTING-------------------------"
docker run --name netshoot --rm -it --network my_network nicolaka/netshoot /bin/bash


"------------------EXAMPLE WITH 5 CONTAINERS-----------------"


