{ config, pkgs, lib, currentDevice, deviceSettings, ... }:
{
 imports = [
  ( import ../global/.privateGlobalConf.nix { inherit config pkgs lib currentDevice deviceSettings;} )
 ];
}
