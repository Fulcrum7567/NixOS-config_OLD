{
  description = "Flake of Fulcrum";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-ld, ... }@inputs:
  let
    currentDeviceFile = import ./devices/currentDevice.nix;
    currentDevice = "PET";
    deviceSettings = import (./devices/${currentDevice}/deviceConfig.nix);
    deviceUserSettings = import (./users/${deviceSettings.user}/deviceSettings/${currentDevice}.nix);

    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${deviceSettings.system};

  in
  {
    # ----- SYSTEM CONFIGURATION ----- #
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = deviceSettings.system;
        modules = [
          ./devices/${currentDevice}/deviceConfigs/configuration.nix
          ./users/${deviceSettings.user}/systemConfig.nix

          nix-ld.nixosModules.nix-ld

          { programs.nix-ld.dev.enable = true; }
        ];
        specialArgs = {
          inherit currentDevice;
          inherit deviceUserSettings;
          inherit lib;
          inherit pkgs;
        };
      };
    };

    # Expose the system configuration as the default package
    defaultPackage.${deviceSettings.system} = self.nixosConfigurations.system.config.system.build.toplevel;

    # ----- HOME-MANAGER CONFIGURATION ----- #
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/${deviceSettings.user}/homeConfig.nix ];
        extraSpecialArgs = {
          inherit deviceSettings;
          inherit deviceUserSettings;
        };
      };
    };
  };
}
