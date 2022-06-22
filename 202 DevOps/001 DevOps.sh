" ------------------------BASIC------------------------- "
# DevOps o Site Realiability Engineer

# -> The basic Docker structure is Linux -> Container Engine -> Docker Container
# -> The Engine communicates with the containers using ports instead of IPs.
# -> dockerhub is the docker image repository, similar to github for code.
# -> Docker Composer permite hacer configuraciones compuestas de modo que puedes
#    preparar la instalación de 5 contenedores que se conecten entre sí y trabajen juntos
#    Kubernetes es un orquestador que reemplaza a Docker Composer

# After openning Windows Powershell
docker --version
docker-compose version


" ------------------------DOCKER CONTAINERS------------------------- "
docker ps -a  # show all docker containers that ran recently
docker ps  # all container that are running right now
docker rm 2034ff394ea2  # delete contatiner by id
docker run hello-world  # test docker installation is ok

# different flavours (you can look for different tags in docker hub)
docker run image:tag  
docker postgres:9.6.21  # specifies the version



# crear contenedor a partir de imagen
# run is for running image as a container, if the image doesn't exist it will execute "docker pull" first
docker run -p 80:80 -p 8080:8080 --name billingapp sotobotero/udemy-devops:0.0.1

docker start billingapp  # iniciar en modo background
docker run -d billingapp # also runs in background (-d = detach)
docker stop billingapp  # stop container

docker run -d -p 8081:80 docker/getting-started  # install demo container
docker log billingapp  # see log for a given container
docker log -f billingapp # logs allow you to slowly scroll down

# run commands inside docker container
docker exec 

docker exec -it f2a09f7a79bd sh  # (i)interactive session with (t)terminal and sh to open shell
                                 # you get inside the container to run commands


" ------------------------DOCKER IMAGE------------------------- "
# to create a image we first need to create a docker file and then execute the build command
# we can also download pre-made images from dockerhub
# then we can use run to turn the image into a container
docker pull sotobotero/udemy-devops  # descargar imagen
docker pull postgress # download the standard docker image


docker image ls  # show images
docker image rm 2034ff394ea2  # you can use both id or name to remove images


" ------------------------TROUBLE SHOOTING------------------------- "
# Verify if any process is using port 80
netstat -aon | findstr :80

# also shows process but doesn't show ports
ps











