" ------------------------BASIC------------------------- "
# DevOps o Site Realiability Engineer

# The basic Docker structure is Linux -> Container Engine -> Docker Container
# The Engine communicates with the containers using ports instead of IPs.
# dockerhub is the docker image repository, similar to github for code.

# After openning Windows Powershell
docker --version
docker-compose version


" ------------------------DOCKER CONTAINERS------------------------- "
docker ps -a  # show all docker containers
docker rm 2034ff394ea2  # delete contatiner by id
docker run hello-world  # test docker installation is ok
docker pull sotobotero/udemy-devops  # descargar imagen

# crear contenedor a partir de imagen
docker run -p 80:80 -p 8080:8080 --name billingapp sotobotero/udemy-devops:0.0.1

docker start billingapp  # iniciar en modo background
docker stop billingapp  # stop container

docker run -d -p 8081:80 docker/getting-started  # install demo container
docker log billingapp  # see log for a given container


" ------------------------DOCKER IMAGE------------------------- "
docker image ls  # show images
docker image rm 2034ff394ea2  # you can use both id or name to remove images


" ------------------------TROUBLE SHOOTING------------------------- "
# Verify if any process is using port 80
netstat -aon | findstr :80

# also shows process but doesn't show ports
ps











