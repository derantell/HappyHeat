#!/bin/bash

echo "--- Installing node.js ---"
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

echo "--- Installing coffee script ---"
sudo npm install -g coffee-script

echo "--- Start init and start app ---"
cd /vagrant/src
sudo npm install
sudo node app.js
