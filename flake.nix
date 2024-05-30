{
 description = "Flake of Fulcrum";

 inputs = {
 
  # define nixpkgs:
  nixpkgs.url = "nixpkgs/nixos-24.05";
  
  # define home-manager:
  home-manager.url = "github:nix-community/home-manager/release-24.05";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";
  
 };


 # ------ OUTPUTS ------ #
 
 outputs = { self, nixpkgs, home-manager, ... }:
  let
  
   currentDevice = "PET";
   currentProfileType = "personal";
   currentProfile = "personal1";
   currentUser = "fulcrum";
   system = "x86_64-linux";
   
   # -- config lib -- #
   lib = nixpkgs.lib;
   
   pkgs = nixpkgs.legacyPackages.${system};
   
  in
 {
  # ----- SYSTEM CONFIGURATION ----- #
  nixosConfigurations = {
   system = lib.nixosSystem {
    inherit system;
    modules = [ (./. + "/users/" + ("/"+(currentUser)) + "/profiles/" + ("/"+(currentProfileType)) + "/" + ("/"+(currentProfile)) + "/configuration.nix") ];
    specialArgs = {
     inherit currentDevice;
    };
   };
  };
  
  # ----- HOME-MANAGER CONFIGURATION ----- #
  homeConfigurations = {
   user = home-manager.lib.homeManagerConfiguration {
    inherit pkgs; 
    modules = [ (./. + "/users/" + ("/"+(currentUser)) + "/profiles/" + ("/"+(currentProfileType)) + "/" + ("/"+(currentProfile)) + "/home.nix")  ];
   };
   specialArgs = {
    inherit currentDevice;
   };
  };
 };
 
 
}
