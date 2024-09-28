#!/bin/sh

# one-click-installation script


# Clone dotfiles
if [ $# -gt 0 ]
  then
    SCRIPT_DIR=$1
  else
    SCRIPT_DIR=~/.dotfiles
fi

nix-shell -p git --command "git clone https://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@github.com/Fulcrum7567/NixOS-config $SCRIPT_DIR"

sudo rm /etc/nixos/configuratiuon.nix
sudo rm /etc/nixos/hardware-configuratiuon.nix

sudo nixos-generate-config

