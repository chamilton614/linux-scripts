#!/bin/bash

############################################
#Change these to match your criteria
############################################
APP=gogs
SERVICE=gogs
APP_HOSTNAME=gogs.apps.192.168.1.101.nip.io
############################################


openssl genrsa -des3 -out rootCA.key 4096

cat << EOF > openssl.conf
[ req ]
distinguished_name=dn
[ dn ]
[ root_ca ]
basicConstraints = critical, CA:true
EOF

openssl req -x509 -config openssl.conf \
  -extensions root_ca -new -nodes \
  -key rootCA.key -sha256 -days 1024 \
  -subj "/CN=RootCertificate" \
  -out rootCA.crt

openssl genrsa -out ${APP_HOSTNAME}.key 2048

openssl req -new -sha256 \
  -key ${APP_HOSTNAME}.key \
  -subj "/C=US/ST=OH/L=Columbus/O=ACMECorp/CN=${APP_HOSTNAME}" \
  -out ${APP_HOSTNAME}.csr

openssl x509 -req -in ${APP_HOSTNAME}.csr \
  -CA rootCA.crt -CAkey rootCA.key \
  -CAcreateserial -out ${APP_HOSTNAME}.crt \
  -days 500 -sha256

oc create route edge ${APP} --service=${SERVICE} \
  --hostname=${APP_HOSTNAME} \
  --key=${APP_HOSTNAME}.key \
  --cert=${APP_HOSTNAME}.crt \
  --ca-cert=rootCA.crt


