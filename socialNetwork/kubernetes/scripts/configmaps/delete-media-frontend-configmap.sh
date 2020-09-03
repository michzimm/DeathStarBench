#!/bin/bash

cd $(dirname $0)/../..

kubectl --kubeconfig=$KUBECONFIG delete -f media-frontend-config/nginx.conf  -n social-network
kubectl --kubeconfig=$KUBECONFIG delete -f media-frontend-config/lua-scripts -n social-network
