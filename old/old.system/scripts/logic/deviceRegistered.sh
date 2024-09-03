#!/bin/sh

if [ $# != 1 ];
then
 echo $0 called with bad args! 
 exit -1;
fi

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

if [ -d "$SCRIPT_DIR/../../../devices/$1" ];
then
 exit 0;
else
 exit 1;
fi
