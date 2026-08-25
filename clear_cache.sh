#!/bin/bash
set -e -o pipefail

echo "Docker system prune"
docker system prune

echo "Docker remove dangling volumes"
docker volume rm -f $(docker volume ls -f "dangling=true")

echo "Remove yay cache"
yay -Scc
