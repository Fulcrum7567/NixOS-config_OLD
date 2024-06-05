#!/bin/sh


if [ $# < 1 ];
then
 read -p "What is the name of the new device? " deviceName
else if [ $# > 1 ];
 echo bad arguments!
 exit -1
fi

if [ deviceName == "" ];
then
 deviceName = $1
fi

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

if [ -d $SCRIPT_DIR/../../devices/$1 ];
then
 echo device $1 already exists.
 echo aborting...
 exit 1
else
 echo creating new device folder with the name $1...
 cp -a $SCRIPT_DIR/../templates/deviceTemplate/. $SCRIPT_DIR/../../devices/$1/
 echo \# Auto-generated file by installer - don\'t change it! > $SCRIPT_DIR/../../devices/$1/hardware/.hardware-configuration.nix
 sudo nixos-generate-config --show-hardware-config >> $SCRIPT_DIR/../../devices/$1/hardware/.hardware-configuration.nix
 
fi
