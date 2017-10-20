#!/usr/bin/env bash
# add the current user to the docker groups, so sude isn't needed
# a logout/in cycle, or a reboot, may be needed after this
sudo groupadd docker
sudo usermod -aG docker $USER
# start the system-wide docker daemon
sudo systemctl start docker
# get a list of images
docker images
# build the docker image from the current directory and name it vaje-jaxrs
sudo docker image build . -t vaje-jaxrs
# look at the new image
docker images
# list the running containers (vaje-jaxrs isn't there yet)
docker container list
# run the container, -d for detached (-it or default is interactive),
# -p X:Y to allow local port X to access the image's port Y
docker container run -d -p 8080:8080 vaje-jaxrs
# see the new container (and its checksum)
docker container list
# a bigger list, also stopped containers
docker container list --all
# stop the container
docker container stop <checksum stem>
# remove the container
docker container rm <checksum stem>
# remove the image
docker image rm vaje-jaxrs
