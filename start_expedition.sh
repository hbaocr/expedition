#!/bin/bash
# to update new images
docker compose pull
docker compose -f ./docker-compose-nobuild.yml  up -d