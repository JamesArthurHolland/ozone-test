#!/bin/bash

if [ -f "$SECRET_FILE" ]; then
  echo "Adding secret file $SECRET_FILE to namespace $NAMESPACE"
  kubectl apply -f $SECRET_FILE -n "$NAMESPACE"
else
    printf "\n\n ERROR: Please add the file: \n\n $SECRET_FILE  \n\n"
    exit 1
fi