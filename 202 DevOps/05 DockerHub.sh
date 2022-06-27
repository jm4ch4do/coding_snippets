"------------------------DOCKER HUB-------------------------"
# dockerhub is the docker image repository, similar to github for code.
# some people refer to it as docker registry
docker login
docker tag 78b6f5560d5f m4ch4do/testing:v1  # duplicating image with a different tag
docker push m4ch4do/test-image:v1  # upload to dockerhub

# You can also specify the ip of the docker host
docker pull 192.168.56.100:5000/my-image


# if you provide only one name when making the pull
# docker uses the name twice assuming is also the name of the registry
docker pull nginx

# is the same as
docker pull nginx/nginx