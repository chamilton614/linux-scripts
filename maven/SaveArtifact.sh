#!/bin/bash

#Variables
LAUNCH_PATH=$(pwd)

REPO_NAME=APPS-JSS-CommonUtilities
PARENT=ApriaFrameworkParent
MODULE=ApriaExceptionFramework

GROUP_ID=com.apria
ARTIFACT_ID=apria-exception
VERSION=0.0.34-SNAPSHOT

REPOSITORY_ID=nexus
URL=http://nexus.apps.192.168.1.101.nip.io/repository/maven-snapshots

#Build and Save Module
#mvn deploy:deploy-file -DgroupId=com.somecompany -DartifactId=project -Dversion=1.0.0-SNAPSHOT -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:8081/repository/maven-snapshots -Dfile=target/project-1.0.0-SNAPSHOT.jar
mvn -f ${LAUNCH_PATH}/${REPO_NAME}/${PARENT}/${MODULE} deploy:deploy-file -DgroupId=${GROUP_ID} -DartifactId=${ARTIFACT_ID} -Dversion=${VERSION} -DgeneratePom=true -Dpackaging=jar -DrepositoryId=${REPOSITORY_ID} -Durl=${URL} -Dfile=target/${ARTIFACT_ID}-${VERSION}.jar

