#!/usr/bin/env bash

SUBJ="/C=US/ST=Oregon/L=Portland/O=Company Name/OU=Org/CN=`hostname`"

cd "$PGDATA"

openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes -subj "$SUBJ"

echo "ssl = on
ssl_cert_file = 'server.crt'
ssl_key_file = 'server.key'" >> postgresql.conf