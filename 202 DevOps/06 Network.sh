" ------------------------DOCKER NETWORK------------------------- "
docker network create my-network  # create docker network
docker network ls                 # list networks
docker network rm my-network      # remove network

# ---------- SQL DATABASE INSIDE NETWORK
docker run -d \
    --network todo-app --network-alias mysql \  # new container is known as mysql inside the network
    -v todo-mysql-data:/var/lib/mysql \  # sql data is stored in local folder
    -e MYSQL_ROOT_PASSWORD=secret \   # setting environment variable for root_password
    -e MYSQL_DATABASE=todos \  # set environment variable for database_name
    mysql:5.7  # this specific mysql container allows certain environment variables
docker exec -it e384a21b6d7d mysql -p  # opens mysql inside the container

docker network connect	# Connect a container to a network
docker network create	# Create a network
docker network disconnect	# Disconnect a container from a network
docker network inspect	my-network  # Display detailed information on one or more networks
docker network ls	# List networks
docker network rm	# Remove one or more networks

# start container inside a network
docker run -it --network my-network nicolaka/netshoot