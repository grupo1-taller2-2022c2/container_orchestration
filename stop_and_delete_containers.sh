#!/bin/bash

. constants.env

echo "Deleting containers if exist..."
{ docker ps -q -f name=$BACKEND_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$FRONTEND_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$DB_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$API_GATEWAY_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo