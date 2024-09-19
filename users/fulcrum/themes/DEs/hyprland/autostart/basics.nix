{ pkgs, ... }:
let
 startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
  waybar &
  swww init

  '';
in  
{
 wayland.windowManager.hyprland.settings = {
  exec-once = ''${startupScript}/bin/start'';
 };
}
