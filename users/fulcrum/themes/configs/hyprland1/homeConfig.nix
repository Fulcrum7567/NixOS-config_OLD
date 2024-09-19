{ pkgs, ... }:
{
 imports = [
  ( import ./../../DEs/hyprland/apps/basics.nix { inherit pkgs; } )
 ];
}
