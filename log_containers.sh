#!/bin/bash

. .env

# docker-compose ps --services --filter "status=running" | grep "users_backend"
# if [ $? -ne 0 ]
# then
#     ps -aux | grep log_containers.sh | awk {'print $2'} | xargs kill -9
#     exit 0
# fi

docker-compose logs -f -t --no-color --tail=1000 $BACKOFFICE_FRONT_SERVICE_NAME > logs/backoffice_front_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $API_GATEWAY_SERVICE_NAME > logs/api_gateway_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $BACKOFFICE_API_GATEWAY_SERVICE_NAME > logs/backoffice_api_gateway_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $USERS_MS_SERVICE_NAME > logs/users_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $USERS_DB_SERVICE_NAME > logs/users_database_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $TRIPS_MS_SERVICE_NAME > logs/trips_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $TRIPS_DB_SERVICE_NAME > logs/trips_database_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $BACKOFFICE_MS_SERVICE_NAME > logs/backoffice_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $BACKOFFICE_DB_SERVICE_NAME > logs/backoffice_database_logs.txt
docker-compose logs -f -t --no-color --tail=1000 $WALLETS_MS_SERVICE_NAME > logs/wallets_logs.txt