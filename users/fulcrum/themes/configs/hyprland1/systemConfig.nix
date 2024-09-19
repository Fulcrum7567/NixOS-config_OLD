{ lib, pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = lib.mkForce false;
  services.xserver.desktopManager.gnome.enable = lib.mkForce false;

  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  services.displayManager.defaultSession = "hyprland";

  

}
