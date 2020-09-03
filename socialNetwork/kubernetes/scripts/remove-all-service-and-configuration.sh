#!/bin/bash

cd $(dirname $0)/..
ls
NS="social-network"

#kubectl --kubeconfig=$KUBECONFIG expose service nginx-thrift -n ${NS}
#kubectl --kubeconfig=$KUBECONFIG expose service jaeger-out -n ${NS}

for service in *.yaml ;  do
  echo $service
  kubectl --kubeconfig=$KUBECONFIG delete -f $service -n ${NS}
done

./scripts/delete-all-configmap.sh

kubectl --kubeconfig=$KUBECONFIG delete namespace ${NS}

cd - >/dev/null
