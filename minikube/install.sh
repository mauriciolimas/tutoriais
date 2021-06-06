#!/bin/bash

echo "----------------------------------------------------------------"
echo "--------------------[ Install Kubernetes ]----------------------"
echo "----------------------------------------------------------------"

echo 'Install Virtual box'
sudo apt install virtualbox virtualbox-ext-pack -y

echo 'Install minikube'
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

echo 'Minikube version'
minikube version

echo 'Install kubectl tool'
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version -o json 


echo "----------------------------------------------------------------"
echo "--------------------[ Configuring Minikube ]--------------------"
echo "----------------------------------------------------------------"

minikube start

echo 'Kubernetes Nodes'
kubectl get Nodes

echo 'Stop minikube'
minikube stop

echo 'Done!'