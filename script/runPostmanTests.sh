#!/bin/bash

if [ -z "$DOMAIN" ]; then
    printf "\n\n ERROR: DOMAIN env var not set for runPostmanTests.sh"
    exit 1
fi
echo "Running postman tests towards $SUBDOMAIN$DOMAIN"
echo "Sleep to allow containers time to become ready."

sleep 40

newman run tests/postman/health_check.postman_collection.json --env-var "host=$SUBDOMAIN$DOMAIN"