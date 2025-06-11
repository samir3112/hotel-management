#!/bin/bash
cd $(dirname "$0")/..

kubectl apply -f k8s/mysql-deployment.yaml
kubectl apply -f k8s/mysql-service.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml


