#!/bin/bash

# You will need to update this to your machines IPv4 Address.
# This is because the backend server can't use localhost when in a docker container.
# It's possible to use Docker networks instead, but I don't want to mess with your docker configuration
# So this will work for the sake of the demonstration.
HOST=192.168.200.2

# Deploy Database
cd database
./start.sh
cd ..

cd backend
./build.sh
./start.sh $HOST
cd ..

# This will take a few minutes since it has to build the react project.
# This is where I would do SSL, but since this is a demonstration, the app will run on port 80 over http
# The host field needs to be passed for the same reason as before. NGINX will route traffic to the backend docker container for API calls
cd nginx
./build.sh $HOST
./start.sh
cd ..
