#!/bin/bash
#Creating the Gogs Repositories

GOGS_API_TOKEN=24bd5809396a8eed64529bf73b359652698ba05d
REPO_NAME=APPS-JSS-AcisSessionApp

#Create the Repo
curl -k -H "Content-Type: application/json" \
-d '{"name":"${REPO_NAME}", "description":"${REPO_NAME} repo", "private":false}' \
-X POST https://gogs.apps.192.168.1.101.nip.io/api/v1/user/repos?token=${GOGS_API_TOKEN}

#http://gogs.apps.192.168.1.101.nip.io/api/v1/user/repos?token=${GOGS_API_TOKEN}

#/admin/users/:username/repos?token=${GOGS_API_TOKEN}

echo ""

