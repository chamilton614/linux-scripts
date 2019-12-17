#!/bin/bash

#Set the version of Maven to download
VERSION=3.6.3

#Save Current Launch Path
LAUNCH_PATH=$(pwd)

#Move to download into /tmp
cd /tmp

#Curl to download the specified version
curl -O http://www-eu.apache.org/dist/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz

#Extract the tarball
tar -xvf apache-maven-${VERSION}-bin.tar.gz

#Move Maven extracted to /opt
sudo mv apache-maven-${VERSION} /opt/maven

#Setup Environment Variables to load Maven
cat <<EOF | sudo tee /etc/profile.d/maven.sh
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=\$PATH:\$MAVEN_HOME/bin
EOF

#Load the Environment Variables
source /etc/profile.d/maven.sh
echo ${MAVEN_HOME}
echo ${PATH}
echo ""

#Validate the Maven install
mvn --version

#Cleanup Downloaded Files
rm -f apache-maven-${VERSION}-bin.tar.gz

#Return back to Launch Path
cd ${LAUNCH_PATH}

