#!/usr/bin/env bash
set -euo pipefail

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

echo "Loading minikube's Docker environment"
eval $(minikube docker-env)

echo "Building the Docker image..."
docker build -t carolynvanslyck.com $ROOT

echo "Generating site..."
docker run --rm -v `pwd`:/srv/jekyll carolynvanslyck.com bundle exec rake build

echo "Copying talk slides..."
rsync -a --delete talk _site/
