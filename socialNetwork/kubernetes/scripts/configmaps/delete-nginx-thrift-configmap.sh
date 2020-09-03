#!/bin/bash

NS="social-network"


cd $(dirname $0)/../..

# directories

kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/gen-lua -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/pages -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/api/home-timeline -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/api/post -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/api/user -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/api/user-timeline -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/wrk2-api/home-timeline -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/wrk2-api/post -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/wrk2-api/user -n ${NS}
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/lua-scripts/wrk2-api/user-timeline -n ${NS}

# file
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/nginx.conf -n ${NS}


# nginx-thrift has a dependency on the ConfigMap nginx-thrift-jaeger, which
# is deleted by the script `create-jaeger-configmap.sh`
