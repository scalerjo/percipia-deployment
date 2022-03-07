#!/bin/bash

USER=todo_readwrite
PASSWORD=password123

docker run -d --name backend --restart=always -p 8888:8888 \
-e HOST=$1 \
-e USER=$USER \
-e PASSWORD=$PASSWORD \
-e GIN_MODE=release \
backend