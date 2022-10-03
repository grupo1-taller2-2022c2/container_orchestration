# container_orchestration
Module in charge of orchestrating all containers (one for each microservice, database and frontend) for development


# Notes and Troubleshooting
1. To start developing, run `./start_dev.sh`. All logs will be saved in real time under the logs directory in this container_orchestration directory.
2. In case of adding any dependencies to a Dockerfile, you should rebuild the image. You should use `docker-compose up -d --build _service_name_in_docker-compose-yml_`, for example `docker-compose up -d --build api_gateway`. After that, run ./start_dev.sh again. If any error happens then do `docker images` and, for those who have "none", copy its id and do `docker rmi _id_`. Repeat the process.
3. If you want to stop and delete all current containers related to this project run `./stop_and_delete_containers.sh`
4. Make sure all repos are in the branches with the latest working solution. This should be corrected later (cloning from git the corresponding branch in every build)