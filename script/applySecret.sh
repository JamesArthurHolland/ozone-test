#!/bin/bash

if [ -f "$SECRET_FILE" ]; then
  echo "Adding secret file $SECRET_FILE to namespace $NAMESPACE"
  echo $kubectl apply -f $SECRET_FILE -n "$NAMESPACE"
elif [ -n "$SECRET_BASE64" ]; then
  echo "$SECRET_BASE64" | base64 -d | kubectl apply -f -
else
    printf "\n\n ERROR: Please add the file: \n\n $SECRET_FILE or env var SECRET_BASE64 \n\n"
    exit 1
fi