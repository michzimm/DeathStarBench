#!/bin/bash

cd $(dirname $0)/..

./scripts/configmaps/delete-jaeger-configmap.sh
./scripts/configmaps/delete-media-frontend-configmap.sh
./scripts/configmaps/delete-nginx-thrift-configmap.sh

cd - >/dev/null
