#!/bin/bash
# Download and install Helm
wget -O helm.tgz https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz
tar -zxvf helm.tgz
mv linux-amd64/helm /usr/local/bin/helm

# Install kubectl
az aks install-cli

# Get minio cluster credentials
az aks get-credentials -g $RESOURCEGROUP -n $CLUSTERNAME

# Install minio helm chart
helm repo add minio https://helm.min.io/
wget -O values.yaml $HELMVALUES
helm upgrade --install --wait minio minio/minio --namespace minio --create-namespace --set azuregateway.enabled=true --set accessKey=$STORAGEACCOUNTNAME --set secretKey=$STORAGEACCOUNTKEY --values values.yaml

#Configure Pod Autoscaler
kubectl autoscale deployment --namespace minio minio --cpu-percent=60 --min=3 --max=50