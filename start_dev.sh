#!/bin/bash

set -e

# Si hay problemas porque algún proceso está usando un puerto, se puede hacer 
# sudo netstat -ano -p tcp | grep <puerto>
# y agarrás el PID y le haces
# sudo kill -9 pid

BACKEND_CONTAINER_NAME="users-backend-container"
FRONTEND_CONTAINER_NAME="backoffice-frontend-container"
DB_CONTAINER_NAME="postgres-container"
API_GATEWAY_CONTAINER_NAME="api-gateway-container"

BACKEND_SERVICE_NAME="users_backend"
FRONTEND_SERVICE_NAME="backoffice_frontend"
DB_SERVICE_NAME="dev_db"
API_GATEWAY_SERVICE_NAME="api_gateway"

./stop_and_delete_containers.sh

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

echo "In case you want to enter inside any docker with bash, run: docker-compose exec _service_name_ /bin/bash"
echo ""
echo "Entering bash console for users backend..."
docker-compose exec $BACKEND_SERVICE_NAME /bin/bash || echo "Wait for image to build and run ./start_dev.sh again..."