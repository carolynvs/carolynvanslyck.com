#!/usr/bin/env bash
set -euo pipefail

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

echo "Loading minikube's Docker environment"
eval $(minikube docker-env)

echo "Building the Docker image..."
docker build -t carolynvanslyck.com $ROOT
