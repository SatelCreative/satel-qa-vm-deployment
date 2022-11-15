#!/bin/bash
APP_NAME=$1
DOCKER_USER=$2
DOCKER_PASS=$3
REGISTRY=$4
CLEAN_BRANCH_NAME=$5

export CLEAN_BRANCH_NAME=$CLEAN_BRANCH_NAME # set this env variable for docker compose

echo "Deploy to ${APP_NAME}-qa.satelapps.com" 
export DOCKER_TLS_VERIFY='1' 
export DOCKER_HOST='tcp://34.234.172.171:2376'
export DOCKER_CERT_PATH='/home/satel/.docker/machine/machines/satel-webapps-qa'
docker login --username=$DOCKER_USER --password=$DOCKER_PASS $REGISTRY
docker stack deploy --with-registry-auth -c docker-compose.qa.yml ${APP_NAME}
