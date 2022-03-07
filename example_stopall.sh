#!/bin/bash

# Deploy Database
cd database
./stop.sh
cd ..

cd backend
./stop.sh
cd ..

cd nginx
./stop.sh
cd ..