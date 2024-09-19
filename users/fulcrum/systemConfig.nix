# SYSTEM CONFIG

{ lib, deviceUserSettings, ... }:
{
 imports = [
  ( import ./themes/configs/${deviceUserSettings.theme}/systemConfig.nix { inherit lib; } )
 ];
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
