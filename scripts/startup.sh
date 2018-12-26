#!/bin/sh

sudo apt-get update
sudo apt-get install -yq wget build-essential apt-transport-https ca-certificates curl gnupg2 software-properties-common

# install docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -yq install docker-ce

# pull image
gcloud auth print-access-token | sudo docker login -u oauth2accesstoken --password-stdin https://asia.gcr.io
sudo docker run -it -d -p 8080:8080 asia.gcr.io/terraform-test-226203/go-web:latest
