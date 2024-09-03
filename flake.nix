{
 description = "Flake of Fulcrum";
 
 inputs = {
 
 
 
  # define nixpkgs:
  nixpkgs.url = "nixpkgs/nixos-23.11";
  
  # define home-manager:
  home-manager.url = "github:nix-community/home-manager/release-23.11";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";
  
  
  
 };
 
 outputs = { self, nixpkgs, home-manager, ... }@inputs:
 let
  currentDeviceFile = import ./devices/currentDevice.nix;
  currentDevice = currentDeviceFile.currentDevice;
  deviceSettings = import (./devices/${currentDevice}/deviceConfig.nix);
  
  
  lib = nixpkgs.lib;
  
  pkgs = (nixpkgs.legacyPackages.${deviceSettings.system});
  
 in
 {
  # ----- SYSTEM CONFIGURATION ----- #
  nixosConfigurations = {
   system = lib.nixosSystem {
    system = deviceSettings.system;
    modules = [ (./users/${deviceSettings.user}/profiles/${deviceSettings.profileType}/${deviceSettings.profile}/.configuration.nix) ];
    specialArgs = {
     inherit currentDevice;
     inherit deviceSettings;
    };
   };
  };
  
  
  # ----- HOME-MANAGER CONFIGURATION ----- #
  homeConfigurations = {
   user = home-manager.lib.homeManagerConfiguration {
    inherit pkgs; 
    modules = [ (./users/${deviceSettings.user}/profiles/${deviceSettings.profileType}/${deviceSettings.profile}/.home.nix) ];
    extraSpecialArgs = {
     inherit currentDevice;
     inherit deviceSettings;
    };
   };
  };

 };

}
