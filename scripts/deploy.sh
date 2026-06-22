#!/bin/bash

kubectl apply -f k8s/base/
kubectl apply -f ingress/

helm upgrade --install devops-app helm/devops-app
