# --------------------------------------------- IMAGES --------------------------------------------
# to create a image we first need to create a docker file and then execute the build command
# we can also download pre-made images from dockerhub
# then we can use run to turn the image into a container

# download, upload
docker pull sotobotero/udemy-devops   # download image from docker hub
docker pull postgress                 # download the standard docker postgres image
docker tag ubuntu:latest localhost:5000/myimg  # re-tags before push to local registry
docker push localhost:5000/myimg      # pushes to local repo

# show
docker image ls                       # show images
docker images                         # same as previous
docker inspect my_image               # shows details of an image
docker inspect nginx --format='{{.ContainerConfig.Hostname}}'  # shows specific detail

# remove
docker image rm 2034ff394ea2          # you can use both id or name to remove images
docker rmi nginx                      # same as previous 
                                      # (verify no container is using the image before deleting)
docker image prune                    # deletes images with no tag and no associated container
docker image prune -a                 # delete all images not referenced by a container

# build
docker build .                        # builds images using cmd in the same folder where the Dockerfile is
docker build -f myDockerfile          # refers to Dockerfile that has a different name
docker build -t myapp:latest .        # simple name (latest is default if not provided)
docker build -t username/myapp:v1.0 . # correct way to name
docker build -t myapp:v2 -f Dockerfile.dev .  # custom Dockerfile

# tag, commit
docker tag 30fb3a7c myapp:latest      # tagging existing untagged image
docker tag myapp:latest myapp:v1.0    # re-tagging image
docker commit 05fa6b new-image        # creates image from container
docker commit --change='CMD ["python3"]' my_container my_image:latest  # changes default command when committing
# supported for --change= CMD, ENTRYPOINT, ENV, EXPOSE, LABEL, ONBUILD, USER, VOLUME, WORKDIR


# -------------------------------------------- LOAD SAVE ------------------------------------------
# layers
# one layer is added to the image per instruction in the Dockerfile
# The last layer is writable and is modified when each container makes changes on top of the base image
# multiple RUN commands and extra layers so it's best to put several commands in a single RUN using &&
# docker will cache prevoiusly used layers to about re-building in future "docker build"
docker history my_image               # shows layers of an image

# export (snapshot a container)
docker export mycont > mycont.tar     # exports container into compressed file
cat mycont.tar | docker import - mycont:latest  # imports container, all layers will be converted to one
                                      # this is called image flattening

# save
docker image load
docker save -o myimg.tar myimg        # saves image to compressed file
docker load -i myimg.tar              # loads image maybe in different computer, layers are preserved 



# ----------------------------------------- DOCKER REGISTRY ---------------------------------------
Docker_Registry                       # open source with limited features (downloaded image)
Docker_Trusted_Registry               # enterprise alternative with advanced features
Private_Repository(AWS_ECR)           # private service
Docker_Hub                            # cloud based offering. Is common to upload here.

# search
docker search nginx --limit 5         # fins image in dockerhub
docker search nginx --filter "is-official=true"  # applies filter

# dockerhub
docker login                          # login to dockerhub(browser open related window)
docker push m4ch4do/test-image        # pushes image to m4ch4do repo in dockerhub
docker pull m4ch4do/myimg:latest      # pulls from dockerhub
docker logout

# private repos
docker login registry.example.com     # syntax for any other private repository
docker pull registry.example.com/youruser/yourimage:tag



