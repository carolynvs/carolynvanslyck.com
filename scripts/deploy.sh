#!/usr/bin/env bash
set -euo pipefail

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd $ROOT

echo "Prepare the _deploy directory..."
pushd _deploy
git fetch origin
git checkout gh-pages
git reset --hard origin/gh-pages
git clean -xdf
popd

echo "Copying _site to _deploy"
rsync -a --delete --exclude .git --exclude talk _site/ _deploy/
rsync -a --delete talk _deploy/

echo "Pushing _deploy to GitHub"
pushd _deploy
git add -A && git commit -m "Site updated at `date`"
git push
popd
