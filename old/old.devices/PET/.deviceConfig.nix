{ config, pkgs, lib, currentDevice, deviceSettings, ... }:

{
 imports = [
  ./hardware/.hardware-configuration.nix
 ];
}

