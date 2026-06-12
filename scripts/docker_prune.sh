#!/bin/bash
set -e -o pipefail

echo "Docker system prune"
docker system prune

echo "docker remove dangling volumes"
docker volume rm -f $(docker volume ls -f "dangling=true")

