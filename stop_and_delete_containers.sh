#!/bin/bash

. .env

echo "Deleting containers if exist..."
{ docker ps -q -f name=$MOBILE_APP_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$BACKOFFICE_FRONT_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$API_GATEWAY_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$BACKOFFICE_API_GATEWAY_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$USERS_MS_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$USERS_DB_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$TRIPS_MS_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$TRIPS_DB_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$BACKOFFICE_MS_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo
{ docker ps -q -f name=$BACKOFFICE_DB_CONTAINER_NAME | xargs docker stop | xargs docker rm; } 2>> /dev/null || echo