"------------------------DOCKER FILE-------------------------"
# Docker files are used to build images


"-----------EXAMPLE ENTRY POINT WITH DEFAULT VALUE------------"
FROM Ubuntu

ENTRYPOINT ["sleep"]

CMD ["5"]


docker ubuntu-sleeper     # uses default value
docker ubuntu-sleeper 10  # replace default value 
docker run --entrypoint new-command ubuntu-sleeper 10  # overwrites the entrypoint


"------------------------EXAMPLE JAVA-------------------------"
# Create New Docker Image (starting JAVA server)
vim Dockerfile
    FROM node:12.22.1-alpine3.11  # using parent image from dockerhub
    
    WORKDIR /app  # sets the working directory. Every command after this will be exec in this folder
    COPY . .  # copia todos los archivos en el folder del DockerFile para /app dentro del contenedor
    RUN yarn install --production  # compilar código de node
    
    CMD ["node", "/app/src/index.js"]  # execute the index.js everytime to do run on the container

docker build .


"--------------------EXAMPLE RUN ON LINUX---------------------"
# simple example of run
vim Dockerfile
FROM python:3.8-alpine
    RUN apk add --update vim  # install VIM when creating container
docker build -t hola-python  # it creates the image


"--------------------EXAMPLE FLASK---------------------"
FROM Ubuntu

RUN apt-get update
RUN apt-get install python

RUN pip install flask
RUN pip install flask-mysql

COPY . /opt/source-code

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run

"--------------------EXAMPLE CMD PYTHON---------------------"
# CMD is used to execute a file everytime you start the container
vim Dockerfile
    FROM python:3.8-alpine
    RUN apk add -update vim
    WORKDIR /usr/src/myapp
    
    COPY . .
    CMD ["python", "/usr/src/myapp/server.py"]
docker build -t hola-python  # creates the image

docker run -p 8080:8080 hola-python  # creates and starts the container using port 8080

# you can also overwrite the CMD command
# for example, you an just overwrite it with a sh (shell) which practically does nothing
# now when you start the container it won't run the python server anymore
docker run -p 8080:8080 hola-python sh


"--------------------EXAMPLE CMD NODE---------------------"
nano Dockerfile
    FROM node:alpine
    COPY . /app
    WORKDIR /app
    CMD node app.js
docker build -t hello-docker .


"--------------------EXAMPLE ENTRYPOINT---------------------"
# requires an input and is not conceived to be overwritten.
vim Dockerfile
    ...
    ENTRYPOINT [ "python" ]
    
# this won't work because is passing the input to Python inside the container
docker run -p 8080:8080 hola-python sh

# but this will work and execute the instructions within the file
docker run hola-python hello.py


"--------------------COPY & ADD---------------------" 
# ---------- COPY or ADD
# ADD allow to pull files from remote locations
# also ADD automatically decompresses files when moving .tar or .zip files


"-------RECOMMENDED DOCKERFILE GOOD PRACTICES-------"
# some tips from a Docker  Conference
FROM debian:use_tag
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    openjdk-8-jdf \
    && rm -rf /var/lib/apt/lists/*  
    
# command1 && command2 : command2 is only executed if command1 returns ans exit status of zero
# --no-install-recommends : is for avoiding installing extra packages
# && rm -rf /var/lib/apt/lists/* : deletes files used in the installation

