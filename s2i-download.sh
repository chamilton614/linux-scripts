#!/bin/bash

#Curl to get the latest version of s2i
VERSION=$(curl -k https://github.com/openshift/source-to-image/releases/latest | awk '{print $5}' | awk -F \" '{print $2}')

#Curl to use the version to get the download path
DOWNLOAD=$(curl -k $VERSION | grep linux-amd64.tar.gz | awk -F = '{print $2}' | awk -F \" '{print $2}' | grep source-to-image)

#wget to download the s2i tar gz
wget https://github.com$DOWNLOAD -O s2i.tar.gz

