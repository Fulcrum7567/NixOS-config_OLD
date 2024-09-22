{ pkgs, ... }:
{
 imports = [
 	./bin/workspaces1.nix
 ];

 programs.waybar = {
  enable = true;
  package = pkgs.waybar;
  settings = {
   mainBar = {
    height = 20;
    layer = "top";
    modules-left = [ "hyprland/workspaces" ];
    modules-center = [ ];
    modules-right = [ ];
    };
   
  };
 };
}