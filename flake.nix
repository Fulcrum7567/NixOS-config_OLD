{
 description = "Flake of Fulcrum";
 
 inputs = {
 
 
 
  # define nixpkgs:
  nixpkgs.url = "nixpkgs/nixos-24.05";
  
  # define home-manager:
  home-manager.url = "github:nix-community/home-manager/release-24.05";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";
  
  
  
 };
 
 outputs = { self, nixpkgs, home-manager, ... }@inputs:
 let
  currentDeviceFile = import ./devices/currentDevice.nix;
  currentDevice = "PET";#currentDeviceFile.currentDevice;
  deviceSettings = import (./devices/${currentDevice}/deviceConfig.nix);
  deviceUserSettings = import (./users/${deviceSettings.user}/deviceSettings/${currentDevice}.nix);
  
  
  lib = nixpkgs.lib;
  
  pkgs = (nixpkgs.legacyPackages.${deviceSettings.system});
  
 in
 {
  # ----- SYSTEM CONFIGURATION ----- #
  nixosConfigurations = {
   system = lib.nixosSystem {
    system = deviceSettings.system;
    modules = [ 
     ./devices/${currentDevice}/deviceConfigs/configuration.nix
     ./users/${deviceSettings.user}/systemConfig.nix
    ];
    specialArgs = {
     inherit currentDevice;
     inherit deviceUserSettings;
     inherit lib;
    };
   };
  };
  
  
  # ----- HOME-MANAGER CONFIGURATION ----- #
  homeConfigurations = {
   user = home-manager.lib.homeManagerConfiguration {
    inherit pkgs; 
    modules = [ (./users/${deviceSettings.user}/homeConfig.nix) ];
    extraSpecialArgs = {
     inherit deviceSettings;
     inherit deviceUserSettings;
    };
   };
  };

 };

}
