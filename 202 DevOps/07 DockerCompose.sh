"---------------------DOCKER COMPOSE---------------------"
# Docker compose offers an easy way of creating containers avoiding long lines using the RUN command
# A new network is created automatically for the new containers everytime you use Docker Compose


"------------------EXAMPLES APP AND MYSQL-----------------"
VIM docker-compose.yml

version: "3.7"  # version of docker compose

services:

  app: 
    image: pablokbs/getting-started:v1
    ports:
      - 3000:3000
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
      
  mysql:
    image: mysql:5.7
    volumes:
      - ./mysql-data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos

docker-compose up -d  # run file in detach mode (background)


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
        