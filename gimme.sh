#!/bin/bash
set -x
IMAGE=$(docker build -q . | cut -d ':' -f2)
CONTAINER=$(docker create -ti $IMAGE)
docker start $CONTAINER
docker exec $CONTAINER tar -zcf /output.tar.gz /output
docker cp $CONTAINER:/output.tar.gz .
