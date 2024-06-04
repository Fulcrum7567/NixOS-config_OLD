{ config, pkgs, lib, currentDevice, deviceSettings, profileUserSettings, ... }:
let
 
 userSettingsFile = ( import ./privateGlobalUserSettings.nix {inherit config pkgs lib currentDevice deviceSettings profileUserSettings;} );
 userSettings = userSettingsFile.userSettingsFinal;

in
{
 imports = [
  ( import ./privateGlobalApps.nix { inherit config pkgs lib currentDevice deviceSettings; profileUserSettings = userSettings;} )
  ( import ../../global/.profileGlobalHome.nix {inherit config pkgslib currentDevice deviceSettings; profileUserSettings = userSettings;} )
  
 ];


}
