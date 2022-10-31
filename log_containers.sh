#!/bin/bash

. .env

docker-compose logs -f --no-color --tail=1000 $MOBILE_APP_SERVICE_NAME > logs/mobile_app_logs.txt &
docker-compose logs -f --no-color --tail=1000 $BACKOFFICE_FRONT_SERVICE_NAME > logs/backoffice_front_logs.txt &
docker-compose logs -f --no-color --tail=1000 $API_GATEWAY_SERVICE_NAME > logs/api_gateway_logs.txt &
docker-compose logs -f --no-color --tail=1000 $BACKOFFICE_API_GATEWAY_SERVICE_NAME > logs/backoffice_api_gateway_logs.txt &
docker-compose logs -f --no-color --tail=1000 $USERS_MS_SERVICE_NAME > logs/users_logs.txt &
docker-compose logs -f --no-color --tail=1000 $USERS_DB_SERVICE_NAME > logs/users_database_logs.txt &
docker-compose logs -f --no-color --tail=1000 $TRIPS_MS_SERVICE_NAME > logs/trips_logs.txt &
docker-compose logs -f --no-color --tail=1000 $TRIPS_DB_SERVICE_NAME > logs/trips_database_logs.txt &
docker-compose logs -f --no-color --tail=1000 $BACKOFFICE_MS_SERVICE_NAME > logs/backoffice_logs.txt &
docker-compose logs -f --no-color --tail=1000 $BACKOFFICE_DB_SERVICE_NAME > logs/backoffice_database_logs.txt &
