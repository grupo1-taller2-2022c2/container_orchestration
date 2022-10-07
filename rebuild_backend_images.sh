#!/bin/bash

. constants.env

./stop_and_delete_containers.sh

docker-compose up -d --build $API_GATEWAY_SERVICE_NAME
docker-compose up -d --build $BACKOFFICE_API_GATEWAY_SERVICE_NAME
docker-compose up -d --build $USERS_MS_SERVICE_NAME
docker-compose up -d --build $TRIPS_MS_SERVICE_NAME
docker-compose up -d --build $BACKOFFICE_MS_SERVICE_NAME

echo ""
echo "Ready. You can know run ./start_dev.sh to lift all containers..."