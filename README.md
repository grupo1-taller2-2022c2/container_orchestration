## container_orchestration
Module in charge of orchestrating all containers (one for each microservice, database and frontend) for development

# Puertos:
* backoffice front: 3003
* api_gateway: 3005
* backoffice_api_gateway: 3006
* users: 3001
* trips: 3002
* backoffice: 3007
* wallets: 3008

# Cómo desarrollar (ambiente de dev)
- Siempre que queramos codear (sin instalar nada en nuestras máquinas) tenemos que ejecutar ```./start_dev```
- Esto va a hacer varias cosas:
  - Para y elimina containers viejos (puede no ser necesario, pero a veces evita errores)
  - Va por cada repositorio haciendo git branch (para alertar sobre qué branch está cada repo) y hace git pull para traer los últimos cambios. Esto es importante porque de esta forma corremos siempre sobre lo último.
    - **IMPORTANTE**: si nos damos cuenta que tenemos que tener uno de los repos en otra branch (porque por ej. ahí están los últimos cambios) vamos a ese repo y checkouteamos a la branch deseada.
  - Se levantan con docker-compose todos los containers:
    - las bases de datos de los microservicios
    - los dos fronts (backoffice web y app mobile)
    - los microservicios en sí
    - el api gateway
  - Se ejecuta docker-compose logs por cada container, que lo que hace es escribir en distintos archivos los logs de cada container
  - Luego de inicializarse se corren las migrations (alembic upgrade head) sobre las bases de datos
  - Finalmente nos deja en una terminal de bash para ejecutar comandos **en el repo de users** por si lo necesitamos

**Notas importantes**:
- Si queremos ver los logs de cada container, los encontramos en container-orchestration/logs
- Los containers (tanto los de python como los de node) tienen el **auto-reload**, lo que quiere decir que si actualizamos código inmediatamente se nos actualiza el servidor/front, sin tener que volver a correr ./start_dev.sh!!!

## Notes and Troubleshooting
0. Si tenemos un error medio raro, lo primero que podemos hacer es rebuildear la del container que nos está dando error (en general son las del back), podemos correr ```./rebuild_backend_images.sh```
1. All logs will be saved in real time under the logs directory in this container_orchestration directory.
2. **In case of adding any dependencies to a Dockerfile, you should rebuild the image. You should use `docker-compose up -d --build _service_name_in_docker-compose-yml_`**, for example `docker-compose up -d --build api_gateway`. After that, run ./start_dev.sh again. If any error happens then do `docker images` and, for those who have "none", copy its id and do `docker rmi _id_`. Repeat the process.
3. If you want to stop and delete all current containers related to this project run `./stop_and_delete_containers.sh`
4. Make sure all repos are in the branches with the latest working solution. This should be corrected later (cloning from git the corresponding branch in every build)
5. Si hay problemas porque algún proceso está usando un puerto, se puede hacer `sudo netstat -ano -p tcp | grep <puerto>` y agarrás el PID y le haces `sudo kill -9 <pid>` para matarlo
6. Si hay problemas con cosas de espacio (ej. *Failed to write all bytes for libcrypto.so.1.1 - fwrite: No space left on device*), podemos liberar espacio que no usamos corriendo `docker system prune -af`
)

- Cualquier cosa [este enlace tiene info interesante](https://ahmed-nafies.medium.com/fastapi-with-sqlalchemy-postgresql-and-alembic-and-of-course-docker-f2b7411ee396)

-----------------------------
-----------------------------

## Liberar espacio de containers, volumenes, imagenes, etc.
`docker system prune --volumes`