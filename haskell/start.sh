#!/bin/bash

DOCKER_IMAGE="mxmo0rhuhn/ghc"
DOCKER_CONTAINER="fmfp"
EXEC_PATH=$(pwd)
CONTAINER_WORKSPACE_LOCATION="/workspace"

function line {
 echo '********************************************************************************'
}

case "$1" in
  setup)
    echo docker build -t $DOCKER_IMAGE .
    docker build -t $DOCKER_IMAGE .
    ;;
  *)
    HAS_RUNNING=$(docker ps | grep "$DOCKER_CONTAINER$" | wc -l )
    if [ $HAS_RUNNING -eq 1 ]; then
      echo "Has running container - changing into"
      echo docker exec -it $DOCKER_CONTAINER bash
      line
      docker exec -it $DOCKER_CONTAINER bash
      exit 0 
    else 
      echo "Has no running container"
    fi

    HAS_CONTAINER=$(docker ps -a | grep "$DOCKER_CONTAINER$" | wc -l )
    echo "HAS_CONTAINER = $HAS_CONTAINER"
    if [ "$HAS_CONTAINER" -eq 0 ]; then
      echo "Has no container - creating one"
      echo docker run -i --name $DOCKER_CONTAINER -v "$EXEC_PATH":$CONTAINER_WORKSPACE_LOCATION -t $DOCKER_IMAGE
      line
      docker run -i --name $DOCKER_CONTAINER -v "$EXEC_PATH":$CONTAINER_WORKSPACE_LOCATION -t $DOCKER_IMAGE
    else
      echo "Has container - starting it"
      echo docker start -i $DOCKER_CONTAINER
      line
      docker start -i $DOCKER_CONTAINER
    fi
    ;;
esac 

exit 0 
