#!/bin/sh
docker-compose -f docker/docker-compose.yml down
docker container prune -f
docker image prune -a -f
