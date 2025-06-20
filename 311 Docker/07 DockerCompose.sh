# ---------------------------------------- DOCKER COMPOSE ---------------------------------------
# Docker compose offers an easy way of creating containers avoiding long lines using the RUN command
# A new network is created automatically for the new containers everytime you use Docker Compose


# ------------------------------------------ COMMANDS -------------------------------------------
# run
docker compose config                 # verify if format is correct
docker compose up -d                  # run file in detach mode (assumes default name docker-compose.yml)
docker compose -f custom_name.yml up  # set custom name
docker compose down                   # removes created containers and networks


# --------------------------------------- BASIC STRUCTURE ---------------------------------------
services:
  webserver:
    image: nginx
  database:
    image: redis


# --------------------------------------- EXTENDED EXAMPLE --------------------------------------
services:
  db: 
    image: mysql:5.7
    volumnes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: somewordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
      MYSQL_DB: wordpress
      
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - "8080:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress


"------------------EXAMPLE WITH 5 CONTAINERS-----------------"
# this can be further improved using Docker Swarm
docker run -d --name=redis redis
docker run -d --name=db postgres:9.4 --link db:db result-app
docker run -d --name=vote -p 5000:80 --link redis:redis voting-app
docker run -d --name=result -p 5001:80
docker run -d --name=worker --link db:db --link redis:redis worker


# DOCKER COMPOSE V1
# this is how to do it in a Docker Compose File version 1
# In version 1 the standard bridge network is used for the implementation
nano docker-compose.yml
    redis:
        image: redis
    db:
        image: postgres:9.4
    vote:
        image: voting-app       build ./vote  # alternative to run a build
        ports:
            - 5000:80
        links:
            - redis
    result:
        image: result-app
        ports:
            -5001:80
        links:
            - db
    worker:
        image: worker
        links:
            - redis
            - db
docker-compose up -d       

# DOCKER COMPOSE V2 (current version is 3)
# In version 2 a new network is created for the new implementation\
# so you don't need to specify the links since the network is dedicated
# version 2 introduces "depends on" that makes sures the right containers are init first
version: 2
services:
    redis:
        image: redis
    db:
        image: postgres:9.4
    vote:
        image: voting-app       
        ports:
            - 5000:80
        depens_on:
            - redis
            
# DOCKER COMPOSE V3 (current version is 3)
# Version 3 supports Docker Swarm
version: 3
services:
    redis:
        image: redis
    db:
        image: postgres:9.4
    vote:
        image: voting-app       
        ports:
            - 5000:80
        depens_on:
            - redis



"------------------EXAMPLE WITH NETWORKS-----------------"
# you can specify in which network each container is available
version: 2
services:
    redis:
        image: redis
        networks:
            - back-end
        
    db:
        image: postgres:9.4
        networks:
            - back-end
        
    vote:
        image: voting-app
        networks:
            - front-end
            - back-end
        
    result:
        image: result
        networks:
            - front-end
            - back-end


networks:
    front-end:
    back-end:


"------------------LINKING CONTAINER-----------------"
# link adds a line in the routing table for the name to be translated into an ip
docker run -d --name=clickcounter --link redis:redis -p 8085:5000 kodekloud/click-counter


"------------------EXAMPLES WITH IPS-----------------"
vim docker-compose.yml
networks:
  lan:
    driver: mcvlan
    driver_opts:
      parent: eth0
    ipam:
      config:
        - subnet: "192.168.0.0/24"
        - gateway: "192.168.0.1"
        
docker-compose up -d
        