{ config, pkgs, lib, currentDevice, deviceSettings, ... }:
let
 # --- User Settings import --- #
 userSettingsFile = ( import ./profileUserSettings.nix {inherit config pkgs lib currentDevice deviceSettings;} );
 userSettings = userSettingsFile.userSettingsFinal;
  
in
{
 imports = [
  ( import ../global/.privateGlobalHome.nix {inherit config pkgs lib currentDevice deviceSettings; profileUserSettings = userSettings;} )
  ( import ./profileApps.nix {inherit config pkgs lib currentDevice deviceSettings; profileUserSettings = userSettings;} )
  
 ];


}
