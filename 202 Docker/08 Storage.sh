"------------------------DATA STORAGE-------------------------"
# docker data gets stored here
/var/lib/docker


"------------------------CREATE/ATTACH VOLUMES-------------------------"
# new volumes are stored in /var/lib/docker/volumes
docker volume create data_volume
docker run -v data_volumne:/var/lib/mysql mysql  # stores mysql data in a separate volume

# docker will automatically create new volumes if they are mounted (volume mount)
docker run -v data_volumne2:/var/lib/mysql mysql  

# you can also choose a different folder to mount outside the docker volumes folder (bind mount)
docker run -v /data/mysql:/var/lib/mysql mysql

# this is the recommended way to do mount with clearer commands
docker run \
  --mount type=bind, source=/data/mysql, target=/var/lib/mysql mysql
