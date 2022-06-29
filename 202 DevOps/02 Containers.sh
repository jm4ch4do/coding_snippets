"------------------------LIST CONTAINERS-------------------------"
docker ps -a  # show all docker containers that ran recently
docker ps  # all container that are running right now
docker inspect my-container  # shows info on a specific container
docker ps --size  # print also size of each container


"----------------------------DELETE-------------------------------"
docker rm 2034ff394ea2  # delete contatiner by id


"-----------------------------RUN---------------------------------"
docker run hello-world  # downloads image if doesn't exist (pull), creates container, runs containter and gets inside

# you may specify internal and external ports and name
docker run -p 80:80 -p 8080:8080 --name billingapp sotobotero/udemy-devops:0.0.1

# Alternatives to start and stop
docker start billingapp  # iniciar en modo background
docker run -d billingapp # also runs in background (-d = detach)
docker stop billingapp  # stop container


"-----------------------------TAGS--------------------------------"
# different flavours (you can look for different tags in docker hub)
docker run image:tag  
docker postgres:9.6.21  # specifies the version


"-----------------------------LOGS-------------------------------"
docker run -d -p 8081:80 docker/getting-started  # install demo container
docker log billingapp  # see log for a given container
docker log -f billingapp # logs allow you to slowly scroll down


docker run -it ubuntu  # starts a new image and gets inside it


"------------------------ENTER CONTAINER-------------------------"
# run commands inside docker container
docker exec 

# get inside
docker exec -it f2a09f7a79bd sh  # (i)interactive session with (t)terminal and sh to open shell
                                 # you get inside the container to run commands

docker attack my-container  # allows you to see the container outputs in your own terminal  


"---------------------------ATTACH DISK---------------------------"
# saving app database and files to local disk instead of inside the container
docker run -d -v /Users/kbs/ejemplo-docker/app/etc:/etc/todos -p 3000:3000 getting-started
                 # local file location             # folder inside docker
                 
#another example
docker run -v /opt/datadir:/var/lib/mysql mysql


"----------------------ENVIRONMENT VARIABLES----------------------"
# SQL DATABASE INSIDE NETWORK
docker run -d \
    --network todo-app --network-alias mysql \  # new container is known as mysql inside the network
    -v todo-mysql-data:/var/lib/mysql \  # sql data is stored in local folder
    -e MYSQL_ROOT_PASSWORD=secret \   # setting environment variable for root_password
    -e MYSQL_DATABASE=todos \  # set environment variable for database_name
    mysql:5.7  # this specific mysql container allows certain environment variables
docker exec -it e384a21b6d7d mysql -p  # opens mysql inside the container