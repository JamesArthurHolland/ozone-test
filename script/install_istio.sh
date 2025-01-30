#!/bin/bash

set -e

echo "installing istio"

istioctl install -y

if [[ -n "$NAMESPACE" ]]; then
  kubectl label namespace "$NAMESPACE" istio-injection=enabled --overwrite
else
  kubectl label namespace default istio-injection=enabled --overwrite
fi
