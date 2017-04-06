#!/usr/bin/env bash
set -euo pipefail

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

echo "Loading minikube's kubectl config"
kubectl config set current-context minikube

echo "Deploying carolynvanslyck.com to the cluster"
kubectl apply -f $ROOT/manifests/deployment.yaml
kubectl apply -f $ROOT/manifests/service.yaml
kubectl apply -f $ROOT/manifests/ingress.yaml

echo "Site ready at http://carolynvanslyck.mini -> $(minikube service cvs --url)"
open http://carolynvanslyck.mini
