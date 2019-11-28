#!/bin/bash

#Get the Cluster name from the passed in parameter
export CLUSTER=$1

#Default User account
USER=admin

#Login to Kubernetes/OpenShift Cluster
oc login -u ${USER} https://${CLUSTER}:8443


