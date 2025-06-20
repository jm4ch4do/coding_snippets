# ------------------------ BASIC -------------------------
# DevOps or Site Realiability Engineer

# -> The basic Docker structure is Linux -> Container Engine -> Docker Container
# -> The Engine communicates with the containers using ports.
# -> Docker Composer permite hacer configuraciones compuestas de modo que puedes
#    preparar la instalación de 5 contenedores que se conecten entre sí y trabajen juntos
# -> Kubernetes es un orquestador que reemplaza a Docker Composer

# After openning Windows Powershell
docker version
docker --version
docker-compose version

# docker image registry
https://hub.docker.com

# access remote
ssh -i docker_rsa root@198.211.108.206
curl -I 198.211.108.206:80