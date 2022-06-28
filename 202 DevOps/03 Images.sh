"------------------------DOCKER IMAGE-------------------------"
# to create a image we first need to create a docker file and then execute the build command
# we can also download pre-made images from dockerhub
# then we can use run to turn the image into a container
docker pull sotobotero/udemy-devops  # descargar imagen
docker pull postgress # download the standard docker postgres image


docker image ls  # show images
docker images    # same as previous

docker image rm 2034ff394ea2  # you can use both id or name to remove images
docker rmi nginx  # same as previous (you must ensure no container is using the image before deleting)