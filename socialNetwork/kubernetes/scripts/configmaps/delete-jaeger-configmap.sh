#!/bin/bash

cd $(dirname $0)/../..

# This script deletes an OpenShift ConfigMap for all the services
# built upon the C++ jaeger client, which uses the jaeger-config.yml
# to find the jaeger end-point URL.
kubectl --kubeconfig=$KUBECONFIG delete -f config/jaeger-config.yml -n social-network

# Since the nginx-thrift service is not built upon the C++ jaeger client,
# this service requires the jaeger-config.json in a different format than
# the one in the ConfigMap jaeger-config. Then, we delete a new ConfigMap.
kubectl --kubeconfig=$KUBECONFIG delete -f nginx-thrift-config/jaeger-config.json -n social-network
