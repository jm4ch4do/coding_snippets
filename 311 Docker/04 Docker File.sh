# -------------------------------------- SIMPLE DOCKER FILE -------------------------------------
# Docker files are used to build images. Simple structure is as follows:
FROM ubuntu                                 # base image
RUN apt-get update                          # runs update command
RUN apt-get -y install nginx                # runs install command
COPY index.nginx-debian.html /var/www/html  # copies web page to inside image
CMD ["nginx", "-g", "daemon off;"]          # starts nginx as default command
CMD nginx -g 'daemon off'                   # alternative, passes command to shell instead of directly to process
                                            # (not recommended)
>> docker build .                           # builds images using cmd in the same folder where the Dockerfile is


# ------------------------------------------- FORMAT --------------------------------------------
FROM base_image                             # the first instruction must alwasy be a FROM pointing to base image
INSTRUCTION arguments                       # A Dockerfile always follows this format
INSTRUCTION arguments                       # Any instruction can follow the initial FROM


# ------------------------------------------ COMMANDS -------------------------------------------
# filesystem                        
WORKDIR /root/demo                          # sets the working dir for any RUN, CMD, ENTRYPOINT, COPY and ADD
WORKDIR some_folder                         # you can set workdir multiple times in the file to change it for following instructions
                                            # you can specify a relative path that will be appended to previous workdir
COPY copy.txt /tmp                          # copies from source to destination
ADD add.txt  /tmp                           # also copies from source to destination and also can extract into destination
ADD http:/example.com/big.tar.xz /tmp       # allows copying from url and directly extract into destination
                                            # (the url part is not recommended), use curl instead
USER nginx                                  # switches to an specific user

# info
LABEL maintainer="you@example.com"          # adds key-value metadata to image
EXPOSE 8080                                 # informs that the container listens on a port (documentation purpose)
                                            # shown in "docker ps" and "docker inspect"
                                            # if you actually want to expose ports you have to use the -p option


# healthcheck (can also be used as parameter of "docker run")
HEALTHCHECK check_to_perform                # docker will display the label healhtly if checks are passing
HEALTCHECK CMD ping -c 1 172.17.0.2         # health check consists of pinging another container                                  
HEALTHCHECK CMD curl -f http://localhost/   # checks if local web is responsive
--start-period=0s, --retries=3              # default values for parameters.  
--interval=30s,                             # time between running checks
--timeout=30s,                              # max time a check can run


# shell commands                           
RUN apt-get update                          # executes command. Can be used multiple times
ENTRYPOINT ["python", "app.py"]             # sets the image's main command, but is intended to not be overriden like CMD
                                            # if you try to override it with CMD, the instruction will be appended instead
CMD ["nginx", "-g", "daemon off;"]          # can be overrided
docker run nginx sleep 10                   # overrides cmd
docker run --entrypoint /bin/sh myimage     # overrides entrypoint
docker run --entrypoint echo myimage Hello  # when using both, CMD becomes appended to entrypoint


# variables                                    
ENV NGINX 1.2                               # sets an environment variable
docker run --env NGINX 1.3 my-web-app       # you can override the env variables when running the container
ARG VERSION=1.0.0                           # defines an internal variable which not exposed as env var
RUN echo "Installing version $VERSION"      # way to use both ENV and ARG in the Dockerfile 
docker build --build-arg VERSION=2.0.1 -t myapp:2.0.1 .  # variables can be passed at build time
