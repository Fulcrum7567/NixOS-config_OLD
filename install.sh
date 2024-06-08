#!/bin/sh

# one-click-installation script


# check whether git is installed
if [ -x /run/current-system/sw/bin/git ];
then
 echo git is already installed, skipping step...;
else
 # install git in system configuration
 sudo sed -i "/environment.systemPackages = with pkgs; \[/a\ \ \ \ git" /etc/nixos/configuration.nix
 
 echo added git to system configuration
 echo rebuilding system...
 
 if sudo nixos-rebuild switch;
 then
  echo rebuild successfull.
  echo git installed successfully.
 else
  echo rebuild failed.
  echo aborting...
  exit -1
 fi
fi

read -p "what is the name of your device? " device

sudo sh ./system/scripts/logic/deviceRegistered.sh $device

if [ $? == 0 ];
then
 echo device "$device" already registered, only changing hardware config...
 echo \# Auto-generated file by installer - don\'t change it! > ./devices/$device/hardware/.hardware-configuration.nix
 sudo nixos-generate-config --show-hardware-config >> ./devices/$device/hardware/.hardware-configuration.nix
else if [ $? == 1 ];
then
 echo device "$device" unknown, creating new one...
 sh ./system/scripts/createNewDevice.sh $device	
 echo "setting $device as current device..."
 sed -i 's/"[^"]*"/"'$device'"/g' ./devices/currentDevice.nix
 git update-index --assume-unchanged ./devices/currentDevice.nix
 
 # grep -F "nixpkgs.hostPlatform = lib.mkDefault" ./hardware-configuration.nix | grep -oP '(?<=")[^"]*(?=")'
 else
  echo there was an error checking your device...
  echo aborting...
  exit -1
 fi
fi

echo rebuilding system...
sh ./system/scripts/rebuildSystem.sh

if [ $? != 0 ];
then
 read -p "Please rebuild your system manually and then press enter to continue..."
fi

echo rebuilding home-manager
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .#user

if [ $? != 0 ];
then
 read -p "Please rebuild your home-manager manually and then press enter to continue..."
fi

echo installer done!
exit 0
