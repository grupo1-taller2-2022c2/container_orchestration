#!/bin/bash
. .env

localhost_private_ip=`hostname -I | awk '{print $1}'`
echo $localhost_private_ip
export HOST_PRIVATE_IP=$localhost_private_ip 

docker-compose up $MOBILE_APP_SERVICE_NAME