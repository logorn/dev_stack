#! /bin/bash

sudo apt-get update
sudo apt-get -y install git

# configuration credentials
git config --global credential.helper 'cache --timeout=$1'
git config --global credential.helper store

# configuration user
git config --global user.name "$2"
git config --global user.email "$3"
