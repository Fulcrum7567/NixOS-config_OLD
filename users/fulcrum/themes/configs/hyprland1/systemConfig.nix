{ lib, ... }:
{
  programs.hyprland.enable = lib.mkForce true;
  services.xserver.displayManager.gdm.enable = lib.mkForce false;
  services.xserver.desktopManager.gnome.enable = lib.mkForce false;
}
