#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

sudo nixos-rebuild switch --flake $SCRIPT_DIR/../../.#system

if [ $? != 0 ];
then
 echo error rebuilding system...
 exit 1
fi
