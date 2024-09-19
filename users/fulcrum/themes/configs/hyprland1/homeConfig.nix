{ pkgs, ... }:
{
 imports = [
  ( import ./../../DEs/hyprland/apps/basics.nix { inherit pkgs; } )
  ./../../DEs/hyprland/bindings/defaults.nix
  ./../../DEs/hyprland/monitors/defaults.nix
  ./../../DEs/hyprland/programs/defaults.nix
  ./../../DEs/hyprland/envVars/defaults.nix
  ./../../DEs/hyprland/lookAndFeel/general/defaults.nix
  ./../../DEs/hyprland/lookAndFeel/decoration/defaults.nix
  ./../../DEs/hyprland/lookAndFeel/animations/defaults.nix
  ./../../DEs/hyprland/lookAndFeel/miscellaneous/defaults.nix
  ./../../DEs/hyprland/input/gestures/defaults.nix
  ./../../DEs/hyprland/input/device/defaults.nix
 ];
 
 wayland.windowManager.hyprland = {
  enable = true;
 };
}
