#!/bin/bash

git clone https://github.com/scalerjo/percipia-frontend.git
cd percipia-frontend
npm install
npm run build
mv build/ ../public
cd ..
rm -r percipia-frontend

./genNginxConf.sh $1

docker build -t nginx .
rm -r public
rm default.conf
