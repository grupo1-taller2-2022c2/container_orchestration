#!/bin/bash

. constants.env

# Este script se explica en el README

./stop_and_delete_containers.sh

# This is to cache credentials so as not to enter them all the time
git config --global credential.helper 'cache --timeout=86400'

# Pulling changes from repos
./update_repos.sh

# Lifting containers
docker-compose up -d $DB_SERVICE_NAME 
sleep 3
docker-compose up -d $FRONTEND_SERVICE_NAME
docker-compose up -d $BACKEND_SERVICE_NAME
docker-compose up -d $API_GATEWAY_SERVICE_NAME

# Logging in files
docker-compose logs -f --no-color --tail=1000 $BACKEND_SERVICE_NAME > logs/users_logs.txt &
docker-compose logs -f --no-color --tail=1000 $FRONTEND_SERVICE_NAME > logs/backoffice_front_logs.txt &
docker-compose logs -f --no-color --tail=1000 $DB_SERVICE_NAME > logs/users_database_logs.txt &
docker-compose logs -f --no-color --tail=1000 $API_GATEWAY_SERVICE_NAME > logs/api_gateway_logs.txt &

sleep 5

echo "Applying migrations to database..."
docker-compose exec $BACKEND_SERVICE_NAME alembic upgrade head || echo "Wait for image to build and run ./start_dev.sh again..."
echo ""
echo "In case you want to enter inside any docker with bash, run: docker-compose exec _service_name_ /bin/bash"
echo ""
echo "Entering bash console for users backend..."
docker-compose exec $BACKEND_SERVICE_NAME /bin/bash || echo "Wait for image to build and run ./start_dev.sh again..."