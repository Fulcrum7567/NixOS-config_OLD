{ config, pkgs, lib, currentDevice, deviceSettings, profileUserSettings, ... }:
let

 # --- User Settings --- #
 # these are getting overwritten by the profile setting if not set to null
 userSettings = {
  wm = null;
 };
in
{
 
 
 

 
 # DON'T CHANGE THIS!! #
 userSettingsFinal = {
  wm = if (profileUserSettings.wm == null) then userSettings.wm else profileUserSettings.wm;
 
 };
}
