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
    HAS_RUNNING=$(docker ps | grep " $DOCKER_CONTAINER " | wc -l )
    if [ $HAS_RUNNING -eq 1 ]; then
      echo "Has running container - changing into"
      line
      echo docker exec -it $DOCKER_CONTAINER bash
      docker exec -it $DOCKER_CONTAINER bash
      exit 0 
    fi

    HAS_CONTAINER=$(docker ps -a | grep " $DOCKER_CONTAINER " | wc -l )
    if [ $HAS_CONTAINER -eq 0 ]; then
      echo "Has no container - creating one"
      line
      echo docker run -i --name $DOCKER_CONTAINER -v "$EXEC_PATH":$CONTAINER_WORKSPACE_LOCATION -t $DOCKER_IMAGE
      docker run -i --name $DOCKER_CONTAINER -v "$EXEC_PATH":$CONTAINER_WORKSPACE_LOCATION -t $DOCKER_IMAGE
    else
      echo "Has container - starting it"
      line
      echo docker start -i $DOCKER_CONTAINER
      docker start -i $DOCKER_CONTAINER
    fi
    ;;
esac 

exit 0 
