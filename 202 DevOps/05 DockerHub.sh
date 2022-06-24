" ------------------------DOCKER HUB------------------------- "
# dockerhub is the docker image repository, similar to github for code.
docker login
docker tag 78b6f5560d5f m4ch4do/testing:v1  # duplicating image with a different tag
docker push m4ch4do/test-image:v1  # upload to dockerhub