#!/bin/bash
find . -type d -name ".svn"|xargs rm -rf
# DATE=`date +%y%m%d`
DATE=161205
docker build --rm=true -t centos6:${DATE} .