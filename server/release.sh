#!/bin/bash
set -e

# Remove the local sitespeed-result dir and node modules to start clean
rm -fR sitespeed-result node_modules

# Super simple release script for sitespeed.io
# Lets use it it for now and make it better over time :)
# You need np for this to work
# npm install --global np
np $1

PACKAGE_VERSION=$(node -e 'console.log(require("./package").version)')

docker build --no-cache -t magecoach/run.mage.coach-server:$PACKAGE_VERSION .

docker login

docker push magecoach/run.mage.coach-server:$PACKAGE_VERSION