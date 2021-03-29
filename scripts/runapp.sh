#!/bin/bash
echo Starting petclinic app
cd /tmp
sudo nohup java -jar spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar > /home/ubuntu/petclinic.log 2>&1 &
