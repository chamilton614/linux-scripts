#!/bin/bash

#Get the User name and the Cluster name from the passed in parameters
export OCPUSER=$1
export OCPCLUSTER=$2

#Check if OCPUSER has a value, if not then prompt the User for it
if [ -z ${OCPUSER} ]; then
        echo 'Enter the OCP User: '
	read OCPUSER
        echo 'Using the OCP User ' ${OCPUSER}
	echo ''
else
        echo 'Using the OCP User ' ${OCPUSER}
	echo ''
fi

#Check if OCPCLUSTER has a value, if not then prompt the User for it
if [ -z ${OCPCLUSTER} ]; then
	echo 'Enter the OCP Cluster URL'
	read OCPCLUSTER
	echo 'Using the OCP Cluster URL ' ${OCPCLUSTER}
	echo ''
else
	echo 'Using the OCP Cluster URL ' ${OCPCLUSTER}
	echo ''
fi

#Login to Kubernetes/OpenShift Cluster
oc login -u ${OCPUSER} ${OCPCLUSTER}


