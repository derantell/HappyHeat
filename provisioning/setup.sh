#!/bin/bash

echo "--- Installing node.js ---"
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

echo "--- Installing some global packages ---"
sudo npm install -g coffee-script
sudo npm install -g docco
sudo npm install -g supervisor

echo "--- Init and start app ---"
cd /vagrant/src
sudo npm install
