#!/bin/bash

URL='https://www.tooplate.com/zip-templates/2134_gotto_job.zip' # URL of the zip file to download
ART_NAME='2134_gotto_job' # Name of the zip file
TEMPDIR="/tmp/webfiles" # Temporary directory to store the downloaded and extracted files

# Set Variables for Ubuntu
PACKAGE="apache2 wget unzip" # Required packages for Apache2 installation
SVC="apache2" # Name of the Apache2 service

echo "Running Setup on Ubuntu"
# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo apt update
sudo apt install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TEMPDIR
echo "cleanup done"