{ config, pkgs, lib, currentDevice, deviceSettings, ... }:
let
 # --- User Settings --- #
 # this settings will override every setting set in more global settings
 # set any setting to null to use global setting
 userSettings = {
  wm = null;
 };
in
{
 imports = [
  ( import ../global/.privateGlobalHome.nix {inherit config; inherit pkgs; inherit deviceSettings; profileUserSettings = userSettings;} )
  
 ];


}
