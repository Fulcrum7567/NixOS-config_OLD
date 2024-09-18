# SYSTEM CONFIG

{ deviceUserSettings, ... }:
{
 imports = [
  ./themes/configs/${deviceUserSettings.theme}/systemConfig.nix
 ];
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
