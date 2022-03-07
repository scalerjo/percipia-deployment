#!/bin/bash
git clone https://github.com/scalerjo/percipia-backend.git
cd percipia-backend
make

cd ..
docker build -t backend .
rm -r percipia-backend