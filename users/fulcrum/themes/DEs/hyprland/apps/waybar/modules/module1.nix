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
    modules-right = [ "battery" ];
    };
   
   "battery" = {
  "bat" = "BAT2";
  "interval" = 0.1;
  "states" = {
    "warning" = 30;
    "critical" = 15;
  };
  "format" = "{capacity}% {icon}";
  "format-icons" = ["" "" "" "" ""];
  "max-length" = 25;
};
  };
};
}