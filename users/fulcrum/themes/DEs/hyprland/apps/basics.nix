{ pkgs, ... }:
{
 home.packages = with pkgs; [
  kitty
  waybar
  rofi-wayland
 ];
}
