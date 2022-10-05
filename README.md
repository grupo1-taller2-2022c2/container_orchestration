# container_orchestration
Module in charge of orchestrating all containers (one for each microservice, database and frontend) for development


# Notes and Troubleshooting
1. To start developing, run `./start_dev.sh`. All logs will be saved in real time under the logs directory in this container_orchestration directory.
2. In case of adding any dependencies to a Dockerfile, you should rebuild the image. You should use `docker-compose up -d --build _service_name_in_docker-compose-yml_`, for example `docker-compose up -d --build api_gateway`. After that, run ./start_dev.sh again. If any error happens then do `docker images` and, for those who have "none", copy its id and do `docker rmi _id_`. Repeat the process.
3. If you want to stop and delete all current containers related to this project run `./stop_and_delete_containers.sh`
4. Make sure all repos are in the branches with the latest working solution. This should be corrected later (cloning from git the corresponding branch in every build)
5. Si hay problemas porque algún proceso está usando un puerto, se puede hacer `sudo netstat -ano -p tcp | grep <puerto>` y agarrás el PID y le haces `sudo kill -9 <pid>` para matarlo

# Commands for working with git
More info at https://git-scm.com/book/en/v2/Git-Tools-Submodules

- `git submodule add` --> para agregar un nuevo submodule
- `git clone --recurse-submodules https://github.com/grupo1-taller2-2022c2/container_orchestration.git` --> para clonar este mismo repo con todos los submodulos dentro listos
- `git submodule update --remote _nombre_submodule_` --> para pullear cambios del remoto de ese submodulo, por defecto en la branch que en remoto apunte a HEAD
- `git config -f .gitmodules submodule.DbConnector.branch _branch_a_trackear_` --> para hacer que un submodule trackee una branch en específico, así solo pullea de esa branch
- `git status`
- `git config status.submodulesummary 1; git status` --> para que muestre el detalle por cada submodule
- `git submodule foreach git pull` --> hace pull en todas los submodules
- `cd _submodule_; git pull` --> hace pull dentro del modulo