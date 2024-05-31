{ config, pkgs, deviceSettings, profileUserSettings, ... }:
let
 # --- User Settings --- #
 # these are getting overwritten by the profile setting if not set to null
 
 userSettings = {
  wm = null;
 };
 
 
 # DON'T CHANGE THIS (unless you want to add a variable to be passed on)
 userSettingsFinal = {
  wm = if (profileUserSettings.wm == null) then userSettings.wm else profileUserSettings.wm;
 };

in
{
 imports = [
  ( import ../../global/profileGlobalHome.nix {inherit config; inherit pkgs; inherit deviceSettings; profileUserSettings = userSettingsFinal;} )
  
 ];


}
