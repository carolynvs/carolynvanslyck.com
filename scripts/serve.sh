#!/usr/bin/env bash
set -euo pipefail

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

echo "Loading minikube's kubectl config"
kubectl config set current-context minikube

echo "HACK: Removing old deployment..."
kubectl delete -f $ROOT/manifests/deployment.yaml &> /dev/null || true

echo "Deploying carolynvanslyck.com to the cluster"
kubectl apply -f $ROOT/manifests/deployment.yaml
kubectl apply -f $ROOT/manifests/service.yaml
kubectl apply -f $ROOT/manifests/ingress.yaml

echo "Site ready at $(minikube service cvs --url)"
open $(minikube service cvs --url)
