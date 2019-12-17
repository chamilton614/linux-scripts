#!/bin/bash

#Variables
LAUNCH_PATH=$(pwd)

REPO_NAME=$1
PARENT=$2
MODULE=$3

#Check if all variables are empty or required ones are and show the proper script syntax
if [ -z "${REPO_NAME}" ] && [ -z "${PARENT}" ] && [ -z "${MODULE}" ]; then
  echo ''
  echo 'This script requires variables to be passed in!'
  echo 'Surround each value in "" and only the 2nd variable is allowed to be empty'
  echo ''
  echo 'Syntax is: BuildArtifact <REPO_NAME> <PARENT> <MODULE>'
  echo 'e.g. ./BuildArtifact.sh "APPS-JSS-OCPESBWebServices" "" "mediationservices"'
  echo ''
  exit 1
else
  if [ -z "${REPO_NAME}" ] || [ -z "${MODULE}" ]; then
    echo ''
    echo 'This script requires variables to be passed in!'
    echo 'Surround each value in "" and only the 2nd variable is allowed to be empty'
    echo ''
    echo 'Syntax is: BuildArtifact <REPO_NAME> <PARENT> <MODULE>'
    echo 'e.g. ./BuildArtifact.sh "APPS-JSS-OCPESBWebServices" "" "mediationservices"'
    echo ''
    exit 1
  fi
fi

#Build Module
if [ -z "${PARENT}" ]
then
	#Variable is empty
	mvn -f ${LAUNCH_PATH}/${REPO_NAME}/${MODULE} clean package
	
else
	#Variable is NOT empty
	mvn -f ${LAUNCH_PATH}/${REPO_NAME}/${PARENT}/${MODULE} clean package
fi
