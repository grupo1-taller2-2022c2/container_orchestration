#!/bin/bash

. constants.env

# Si le pasas el nombre de una branch, te checkoutea todos los repos a esa branch (hacer esto si está todo commiteado)
branch_to_use=${1:-'current'}

declare -a arr=($API_GATEWAY_REPO_NAME
                $BACKOFFICE_FRONT_REPO_NAME
                $MOBILE_APP_REPO_NAME
                $USERS_MS_REPO_NAME
                $TRIPS_MS_REPO_NAME)

for repo in "${arr[@]}"
do
    echo "$repo in branch"
    cd ../$repo
    if [[ $branch_to_use != 'current' ]]; then
        git checkout $branch_to_use
    fi 
    git branch
    git pull
done