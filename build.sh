#!/bin/bash

# set -x
# pwd

# cd "./src/github.com/rsmaxwell/players-tt"

pwd
ls -al 

ng add --skip-confirmation --defaults @angular/material
npm install @angular/cdk
npm install @angular/flex-layout
npm install @angular/animations
npm install bootstrap
npm install hammerjs
npm install hammerjs
npm install ngx-mqtt
npm install guid-typescript

ng build
