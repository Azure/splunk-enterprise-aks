#!/bin/bash

# Install kubectl
az aks install-cli

# Get minio cluster credentials
az aks get-credentials -g $RESOURCEGROUP -n $CLUSTERNAME

# Create License file
LICENSEFILE=$(echo $LICENSEFILE | tr -d '[:blank:]\n')
echo $LICENSEFILE | base64 -d > /tmp/Splunk.License

# Install Splunk Operator
kubectl apply -f $SPLUNKOPERATORURL
kubectl wait --for condition="established" crd --all

# Create Splunk namespace
kubectl create namespace splunk --dry-run -o yaml | kubectl apply -f -

# Add license to configmap
kubectl create configmap --namespace splunk splunk-licenses --from-file=/tmp/Splunk.License --dry-run -o yaml | kubectl apply -f -

# Add storage account auth secret
kubectl create secret generic --namespace splunk s2keys --from-literal="s3_access_key=$STORAGEACCOUNTNAME" --from-literal="s3_secret_key=$STORAGEACCOUNTKEY"

# Install Splunk
wget -O splunk.yaml $SPLUNKDEPLOYMENTYAML
sed -i "s/{region}/$REGION/g" splunk.yaml
kubectl apply -f splunk.yaml