#!/bin/bash

. .env

docker-compose down --rmi all -v --remove-orphans

# docker-compose build --no-cache $API_GATEWAY_SERVICE_NAME
# docker-compose build --no-cache $BACKOFFICE_API_GATEWAY_SERVICE_NAME
# docker-compose build --no-cache $USERS_MS_SERVICE_NAME
# docker-compose build --no-cache $TRIPS_MS_SERVICE_NAME
# docker-compose build --no-cache $BACKOFFICE_MS_SERVICE_NAME

echo ""
echo "Ready. You can know run ./start_dev.sh to lift all containers..."