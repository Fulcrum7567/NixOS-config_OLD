{ config, pkgs, lib, currentDevice, deviceSettings, ... }:
{
 imports = [
  ( import ../../global/.profileGlobalConfig.nix {inherit config pkgs lib currentDevice deviceSettings;} )
 ];
}
