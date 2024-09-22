{ pkgs, ... }:
{
 imports = [
  ( import ./../../DEs/hyprland/apps/basics.nix { inherit pkgs; } )
  ./../../DEs/hyprland/bindings/custom1.nix
  ./../../DEs/hyprland/bindings/appLaunch.nix
  ./../../DEs/hyprland/monitors/defaults.nix
  ./../../DEs/hyprland/programs/defaults.nix
  ./../../DEs/hyprland/envVars/defaults.nix
  ./../../DEs/hyprland/lookAndFeel/general/defaults.nix
  ./../../DEs/hyprland/lookAndFeel/decoration/custom1.nix
  ./../../DEs/hyprland/lookAndFeel/animations/custom1.nix
  ./../../DEs/hyprland/lookAndFeel/miscellaneous/custom1.nix
  ./../../DEs/hyprland/input/gestures/custom1.nix
  ./../../DEs/hyprland/input/device/defaults.nix
  ./../../DEs/hyprland/input/input/custom1.nix
  ( import ./../../DEs/hyprland/autostart/basics.nix { inherit pkgs; } )
 ];
 
 wayland.windowManager.hyprland = {
  enable = true;
 };
}
