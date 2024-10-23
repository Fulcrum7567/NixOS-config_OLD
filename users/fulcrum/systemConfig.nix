# SYSTEM CONFIG

{ lib, pkgs, deviceUserSettings, ... }:
{
 imports = [
  ( import ./themes/configs/${deviceUserSettings.theme}/systemConfig.nix { inherit lib pkgs; } )
 ];
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };

  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowInsecure = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "electron-25.9.0"
  ];
            
}
