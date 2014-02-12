#!/bin/bash

echo "--- Installing node.js ---"
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

echo "--- Install app depenedencies ---"
cd /vagrant/src
sudo npm install
