# SYSTEM CONFIG

{ lib, pkgs, deviceUserSettings, ... }:
{
 imports = [
  ( import ./themes/configs/${deviceUserSettings.theme}/systemConfig.nix { inherit lib pkgs; } )
 ];
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
