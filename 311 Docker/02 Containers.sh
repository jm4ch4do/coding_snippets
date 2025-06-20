# ------------------------------------------ CONTAINERS -------------------------------------------
# list
docker ps -a                   # show all docker containers that ran recently
docker ps                      # all container that are running right now
docker inspect my-container    # shows info on a specific container
docker ps --size               # print also size of each container
docker ps -aq                  # prints only the ids
docker container ls            # docker is moving towards this longer syntax

# Stop, Delete
docker stop billingapp         # stop container
docker stop $(docker ps -aq)   # stops all containers
docker rm 2034ff394ea2         # delete contatiner by id
docker rm mynginx -f           # forces removal even if container is running (not recommended)

# Run
docker run hello-world         # downloads image if doesn't exist (pull), creates container, gets inside
docker run -it ubuntu          # starts a new image and gets inside it (foreground mode)
docker run -it ubuntu  --rm    # automatically remove container when it exits
docker run image:tag           # different flavours (you can look for different tags in docker hub) 
                               # if no tag is specified it assumes latest
docker run -dt -p 80:80 nginx  # binds machine port to docker port
docker run --name my-ubuntu ubuntu  # gives a name to the container
                               # if no name is provided docker assigns a random two word name
# Alternative Run
docker start billingapp        # starts a previously created container in background mode
docker run -d billingapp       # also runs in background (-d = detach)
docker container start billin  # new syntax

# Advanced Run
# you may specify internal and external ports and name
docker run -p 80:80 -p 8080:8080 --name billingapp sotobotero/udemy-devops:0.0.1
docker run -P nginx            # Publish all exposed ports from the container to random ports in host


# --------------------------------------------- ENTER ---------------------------------------------
# the command send through exec only runs while the container's primary process (PID 1) 
# is running and it is not restarted if the container is restarted
docker exec [OPTIONS] <container> <command>  # run commands inside docker container
docker exec -it f2a09f7a79bd sh   # enters container to run commands
                                  # (i)interactive session with (t)terminal and sh to open shell
docker attack my-container        # allows you to see the container outputs in your own terminal

# Logs
docker log billingapp             # see log for a given container
docker log -f billingapp          # logs allow you to slowly scroll down
docker inspect mynginx            # shows lots of information on docker


# --------------------------------------------- DISK ----------------------------------------------
# saving app database and files to local disk instead of inside the container
docker run -d -v /Users/kbs/ejemplo-docker/app/etc:/etc/todos -p 3000:3000 getting-started
                 # local file location             # folder inside docker
# another example
docker run -v /opt/datadir:/var/lib/mysql mysql


# ------------------------------------------- ENV VARS --------------------------------------------
# SQL DATABASE INSIDE NETWORK
docker run -d \
    --network todo-app --network-alias mysql \  # new container is known as mysql inside the network
    -v todo-mysql-data:/var/lib/mysql \         # sql data is stored in local folder
    -e MYSQL_ROOT_PASSWORD=secret \             # setting environment variable for root_password
    -e MYSQL_DATABASE=todos \                   # set environment variable for database_name
    mysql:5.7                                   # this specific mysql container allows certain environment variables
docker exec -it e384a21b6d7d mysql -p           # opens mysql inside the container


# ----------------------------------- DEFAULT CONTAINER COMMAND -----------------------------------
# every container starts with a given process as PID 1, it may be systemctl or bash or nginx
# every container has a default container command that was specified when building the image
# often if you download an nginx image, the specified default command will be nginx
CMD ["nginx", "-g", "daemon off;"]              # example of default command in Dockerfile

# you can also specify the command you want which replaces the default one
docker container run -d nginx sleep 500         # replaces default command by sleep 500


# --------------------------------------- RESTART POLICIES ----------------------------------------
# docker container will not restart if they are exited or if the docker daemon is restarted
# you can change this behavior using restart policies.
# the --restart option may take no(default), on-failure, unless-stopped, always
docker container run -d --restart unless-stop nginx  # do docker stop to stop it


# ------------------------------------------ DISK USAGE -------------------------------------------
df -h                             # show space per disk
docker system df                  # shows space per image, container, etc
docker system df -v               # shows more details
