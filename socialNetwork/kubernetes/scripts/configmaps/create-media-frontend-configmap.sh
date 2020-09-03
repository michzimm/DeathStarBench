#!/bin/bash

cd $(dirname $0)/../..

kubectl --kubeconfig=$KUBECONFIG create cm media-frontend-nginx --from-file=media-frontend-config/nginx.conf  -n social-network
kubectl --kubeconfig=$KUBECONFIG create cm media-frontend-lua   --from-file=media-frontend-config/lua-scripts -n social-network
