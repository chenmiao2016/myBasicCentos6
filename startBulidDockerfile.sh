#!/bin/bash
find . -type d -name ".svn"|xargs rm -rf
# DATE=`date +%y%m%d`
DATE=0.1
docker build --rm=true -t base:${DATE} .
