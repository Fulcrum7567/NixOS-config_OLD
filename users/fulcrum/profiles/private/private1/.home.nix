{ config, pkgs, lib, currentDevice, deviceSettings, ... }:
let
 # --- User Settings --- #
 # this settings will override every setting set in more global settings
 # set any setting to null to use global setting
 userSettingsFile = ( import ./profileUserSettings.nix {inherit config pkgs lib currentDevice deviceSettings;} )
 userSettings = userSettingsFile.userSettingsFinal;
  
in
{
 imports = [
  ( import ../global/.privateGlobalHome.nix {inherit config; inherit pkgs; inherit deviceSettings; profileUserSettings = userSettings;} )
  ( import ./profileApps {inherit config; inherit pkgs; inherit deviceSettings; profileUserSettings = userSettings;} )
  
 ];


}
