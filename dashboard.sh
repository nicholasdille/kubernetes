#!/bin/bash

wget https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
patch kubernetes-dashboard.yml < dashboard.patch
kubectl -n kube-systemys create serviceaccount my-dashboard-sa
kubectl -n kube-system create clusterrolebinding my-dashboard-sa --clusterrole=cluster-admin --serviceaccount=kube-system:my-dashboard-sa
kubectl apply -f dashboard.yml