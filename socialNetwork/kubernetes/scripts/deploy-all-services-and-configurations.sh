#!/bin/bash

cd $(dirname $0)/..
NS="social-network"

kubectl --kubeconfig=$KUBECONFIG create namespace ${NS}
#kubectl --kubeconfig=$KUBECONFIG adm policy add-scc-to-user anyuid -z default -n ${NS}
#kubectl --kubeconfig=$KUBECONFIG adm policy add-scc-to-user privileged -z default -n ${NS}

./scripts/create-all-configmap.sh

# The following script optionally creates lkubectl --kubeconfig=$KUBECONFIGal dkubectl --kubeconfig=$KUBECONFIGker images suitable for lkubectl --kubeconfig=$KUBECONFIGal customization.
# ./scripts/build-dkubectl --kubeconfig=$KUBECONFIGker-img.sh

for service in *.yaml ;  do
  kubectl --kubeconfig=$KUBECONFIG create -f $service -n ${NS}
done

#kubectl --kubeconfig=$KUBECONFIG expose service nginx-thrift -n ${NS}
#kubectl --kubeconfig=$KUBECONFIG expose service jaeger-out -n ${NS}

echo "After all pods are running (kubectl get pods):"
echo "Follow the instructions in kubernetes/README.md to configure and run init_social_graph.py to load the dataset."

cd - >/dev/null
