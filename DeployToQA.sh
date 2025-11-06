#!/bin/bash

export CLEAN_BRANCH_NAME=$CLEAN_BRANCH_NAME # set this env variable for docker compose

if [[ -n $WORK_DIR ]]
then
    cd $WORK_DIR
fi   

echo "Deploy to ${APP_NAME}-qa.satel.ca" 
export DOCKER_TLS_VERIFY='1' 
export DOCKER_HOST='tcp://35.170.70.47:2376'
export DOCKER_CERT_PATH='/home/satel/.docker/machine/machines/satel-webapps-qa'

if [[ ! $REGISTRY_TYPE ]]; then
    docker login --username=$DOCKER_USER --password=$DOCKER_PASS $REGISTRY
fi

docker stack deploy --with-registry-auth -c docker-compose.qa.yml ${APP_NAME}
