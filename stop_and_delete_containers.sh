#!/bin/bash

BACKEND_CONTAINER_NAME="users-backend-container"
FRONTEND_CONTAINER_NAME="backoffice-frontend-container"
DB_CONTAINER_NAME="postgres-container"
API_GATEWAY_CONTAINER_NAME="api-gateway-container"

echo "Deleting containers if exist..."
{ docker ps -q -f name=$BACKEND_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$FRONTEND_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$DB_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$API_GATEWAY_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo