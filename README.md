# percipia-deployment
## Deploying
### This is the only project you will actually need to clone. There is 1 thing you need to change in example_deploy.sh
### You must replace my IP address with your IP address. More information why this is needed is included in the script as comments.
```
#!/bin/bash

# You will need to update this to your machines IPv4 Address.
# This is because the backend server can't use localhost when in a docker container.
# It's possible to use Docker networks instead, but I don't want to mess with your docker configuration
# So this will work for the sake of the demonstration.
HOST=192.168.200.2

# Deploy Database
cd database
./start.sh
........
```
### Run this command to start the system
```
./example_deploy.sh
```
### Make sure to have the proper rights to the docker daemon or it will break.
### If golang is installed in /usr/local/go/bin/go, running with sudo will break the deployment script.
### To work around this, login as root or grant your user rights to the docker daemon. 