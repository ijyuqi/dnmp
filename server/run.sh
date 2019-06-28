#!/bin/bash
DIR=$(dirname $(realpath $0))
cd ${DIR}
echo "========== Start container "
docker-compose up -d &&
echo "========== closed container "
docker-compose down
echo "========== clean closed container "
docker system prune -f
echo "========== clean data volume "
docker volume prune -f
echo "========== clean data"
sudo rm -rf $DIR/mysql/data/*
