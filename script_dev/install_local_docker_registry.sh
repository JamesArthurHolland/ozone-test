#!/bin/bash

echo "Local docker"

helm repo add twuni https://helm.twun.io || true

echo "install docker-registry"

helm install --set ingress.enabled=false \
  --namespace docker-registry \
  --create-namespace \
  --set persistence.enabled=true \
  --set persistence.size=40Gi \
  docker-registry twuni/docker-registry || true

kubectl apply -f - <<END
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: ozone-test-docker-registry-gateway-local
  namespace: istio-system
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: 80
        name: http
        protocol: HTTP
      hosts:
        - "registry.local"
END

kubectl apply -n docker-registry -f - <<END
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: ozone-test-docker-registry-virtualservice
spec:
  hosts:
    - registry.local
  gateways:
    - istio-system/ozone-test-docker-registry-gateway-local
  http:
    - route:
        - destination:
            host: docker-registry.docker-registry.svc.cluster.local
            port:
              number: 5000
END
