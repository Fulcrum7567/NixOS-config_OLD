{ pkgs, ... }:
{

 imports = [
  ( import ./waybar/presets/waybar1.nix { inherit pkgs; } )
 ];

 home.packages = with pkgs; [
  kitty
  waybar
  rofi-wayland
  swww
  dunst
  
  kdePackages.qtwayland
  kdePackages.qtsvg
  kdePackages.dolphin

 ];
}
