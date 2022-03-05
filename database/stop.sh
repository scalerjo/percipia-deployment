#!/bin/bash
docker ps -f name=pgtodo -aq | sudo xargs docker rm -f