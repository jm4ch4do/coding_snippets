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


"------------------------DRIVERS-------------------------"
# bridge:  the host network interface is shared with docker
# host:    every container uses your own ip address
# overlay: allows different networks to communicate
# macvlan: allows assigning macs to containers
# none:    deactivate the containers network

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


