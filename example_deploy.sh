#!/bin/bash

# You will need to update this to your machines IPv4 Address.
# This is because the backend server can't use localhost when in a docker container.
# It's possible to use Docker networks instead, but this is fine for the sake of the demonstration.
HOST=192.168.200.2

# Deploy Database
cd database
./start.sh
cd ..

cd backend
./build.sh
./start.sh $HOST
cd ..

cd nginx
./build.sh
./start.sh
cd ..
