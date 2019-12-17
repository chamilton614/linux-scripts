#!/bin/bash

#Save Current Launch Path
LAUNCH_PATH=$(pwd)

#Install the vscode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

#Update the package cache and install
sudo dnf check-update
sudo dnf install -y code

#Return back to Launch Path
cd ${LAUNCH_PATH}

