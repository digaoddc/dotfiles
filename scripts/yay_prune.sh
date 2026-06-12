#!/bin/bash
set -e -o pipefail

echo "Remove yay cache"
yay -Scc
