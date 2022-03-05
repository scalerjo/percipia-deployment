#!/bin/bash

POSTGRES_PASS=password123


if [ ! -d "/tmp/data" ]
then
    mkdir /tmp/data
    echo "Created /data directory"
fi

if [ ! -d "/tmp/data/pg" ]
then
    mkdir /tmp/data/pg
    echo "Created /data/pg directory"
fi

docker pull postgres

docker run -d --name pgtodo --restart=always \
-v /tmp/data/pg:/var/lib/postgresql/data \
-e POSTGRES_PASSWORD=$POSTGRES_PASS \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-p 5432:5432 \
postgres

docker cp ./init.sql pgtodo:/docker-entrypoint-initdb.d/init.sql