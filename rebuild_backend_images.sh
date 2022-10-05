#!/bin/bash

. constants.env

./stop_and_delete_containers.sh

docker-compose up -d --build $BACKEND_SERVICE_NAME
docker-compose up -d --build $API_GATEWAY_SERVICE_NAME

echo ""
echo "Ready. You can know run ./start_dev.sh to lift all containers..."