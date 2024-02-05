#!/usr/bin/env bash

SECONDS=0

echo "start time: " `date`
echo -e        "\e[32m--------------------------- Kill all ------------------\e[39m"
read -p 'Are you ready? [y/N]: ' yes_var
if [ $yes_var != 'y' ]; then
    exit
else
    echo Lets go...
fi

echo -e        "\e[32m--------------------------- Kill all containers ------------------\e[39m"

docker kill $(docker ps -q)

echo -e        "\e[32m--------------------------- rm all images ------------------\e[39m"
docker image prune -a
docker rmi $(docker images -q)
docker image rm $(docker image ls -f dangling=true -q)

echo -e        "\e[32m--------------------------- rm all volumes ------------------\e[39m"
docker volume rm $(docker volume ls -q)

echo -e        "\e[32m--------------------------- prune all ------------------\e[39m"
docker system prune
docker container prune
docker volume prune
docker builder prune

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
