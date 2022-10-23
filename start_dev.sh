#!/bin/bash

. constants.env

# Este script se explica en el README

./stop_and_delete_containers.sh

# This is to cache credentials so as not to enter them all the time
git config --global credential.helper 'cache --timeout=86400'

# Pulling changes from repos
./update_repos.sh

# Lifting containers
docker-compose up -d $USERS_DB_SERVICE_NAME
docker-compose up -d $TRIPS_DB_SERVICE_NAME
docker-compose up -d $BACKOFFICE_DB_SERVICE_NAME 

sleep 5

docker-compose up -d $BACKOFFICE_FRONT_SERVICE_NAME
docker-compose up -d $API_GATEWAY_SERVICE_NAME
docker-compose up -d $BACKOFFICE_API_GATEWAY_SERVICE_NAME
docker-compose up -d $USERS_MS_SERVICE_NAME
docker-compose up -d $TRIPS_MS_SERVICE_NAME
docker-compose up -d $BACKOFFICE_MS_SERVICE_NAME

sleep 5

# Logging in files
mkdir logs

echo "Applying migrations to users database..."
docker-compose exec $USERS_MS_SERVICE_NAME alembic upgrade head || echo "Wait for image to build and run ./start_dev.sh again..."

echo "Applying migrations to trips database..."
docker-compose exec $TRIPS_MS_SERVICE_NAME alembic upgrade head || echo "Wait for image to build and run ./start_dev.sh again..."

echo "Applying migrations to backoffice database..."
docker-compose exec $BACKOFFICE_MS_SERVICE_NAME alembic upgrade head || echo "Wait for image to build and run ./start_dev.sh again..."

echo ""
echo "In case you want to enter inside any docker with bash, run: docker-compose exec _service_name_ /bin/bash"

./log_containers.sh