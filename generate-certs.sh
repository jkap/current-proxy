#!/bin/sh

if [ -e "server.key" ] && [ -e "server.crt" ]; then
  exit 0
fi

openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

openssl rsa -passin pass:x -in server.pass.key -out server.key

rm server.pass.key

openssl req -nodes -newkey rsa:2048 -keyout server.key -out server.csr -subj \
"/C=US/ST=California/L=Oakland/O=current-condition/CN=currentcondition.local"

openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt

rm server.csr
