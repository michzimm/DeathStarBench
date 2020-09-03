#!/bin/bash

NS="social-network"

cd $(dirname $0)/../..

kubectl --kubeconfig=$KUBECONFIG create cm media-frontend-nginx --from-file=media-frontend-config/nginx.conf  --dry-run --save-config -o yaml -n ${NS} | kubectl --kubeconfig=$KUBECONFIG apply -f - -n ${NS}
kubectl --kubeconfig=$KUBECONFIG create cm media-frontend-lua   --from-file=media-frontend-config/lua-scripts --dry-run --save-config -o yaml -n ${NS} | kubectl --kubeconfig=$KUBECONFIG apply -f - -n ${NS}
