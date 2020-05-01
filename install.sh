#!/bin/bash

cd ~/Downloads

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
apt-get install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update && sudo apt-get install -y google-cloud-sdk

apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

mkdir helm2
mkdir helm3

wget https://get.helm.sh/helm-v2.16.6-linux-amd64.tar.gz
wget https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz

tar -xzvf helm-v2.16.6-linux-amd64.tar.gz --directory helm2
tar -xzvf helm-v3.2.0-linux-amd64.tar.gz --directory helm3

cp helm2/linux-amd64/helm /usr/local/bin/helm
cp helm3/linux-amd64/helm /usr/local/bin/helm3
