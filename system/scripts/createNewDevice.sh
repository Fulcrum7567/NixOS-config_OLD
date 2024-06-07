#!/bin/sh


if [ $# -lt 1 ];
then
 read -p "What is the name of the new device? " deviceName
elif [ $# -gt 1 ];
then
 echo bad arguments!
 exit -1;
fi

deviceName=${deviceName:-$1}

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

if [ -d $SCRIPT_DIR/../../devices/$deviceName ];
then
 echo device "$deviceName" already exists.
 echo aborting...
 exit 1
else
 echo creating new device folder with the name $deviceName...
 cp -a $SCRIPT_DIR/../templates/deviceTemplate/. $SCRIPT_DIR/../../devices/$deviceName/
 echo \# Auto-generated file by installer - don\'t change it! > $SCRIPT_DIR/../../devices/$deviceName/hardware/.hardware-configuration.nix
 sudo nixos-generate-config --show-hardware-config >> $SCRIPT_DIR/../../devices/$deviceName/hardware/.hardware-configuration.nix
 printf "{\n deviceSettings = {\n" > $SCRIPT_DIR/../../devices/$deviceName/deviceSettings.nix
 userInput=""
 while IFS= read -u 3 -r line; do
  setting=$( echo $line | grep -oP '[^ =]*' | head -n1)
  value=$( echo $line | grep -oP '[^ =]*' | tail -n1)
  read -p "What value do you want '$setting' to be? (default: $value) " userInput
  value=${userInput:-$value}
  echo "new value: $value"
  if [ "$value" == "null" ];
  then
   printf "  $setting = null;\n" >> $SCRIPT_DIR/../../devices/$deviceName/deviceSettings.nix
  else
   printf "  $setting = \"$value\";\n" >> $SCRIPT_DIR/../../devices/$deviceName/deviceSettings.nix
  fi
 done 3< $SCRIPT_DIR/../templates/deviceSettingsTemplate.txt
 printf " };\n}" >> $SCRIPT_DIR/../../devices/$deviceName/deviceSettings.nix
 echo creation complete.
 exit 0
fi
