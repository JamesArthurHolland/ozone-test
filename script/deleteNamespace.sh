#!/bin/bash

echo "Deleting namespace $NAMESPACE..."

kubectl delete ns "$NAMESPACE"