{ lib, ... }:
{
  programs.hyprland.enable = lib.mkForce false;
  services.xserver.displayManager.gdm.enable = lib.mkForce true;
  services.xserver.desktopManager.gnome.enable = lib.mkForce true;
}
