#!/bin/bash

sudo docker run -d --restart=always --name nginx-todo \
-p 80:80 \
nginx