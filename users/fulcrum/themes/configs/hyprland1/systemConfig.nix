{ lib, pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = lib.mkForce false;
  services.xserver.desktopManager.gnome.enable = lib.mkForce false;

  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  services.displayManager.defaultSession = "hyprland";

  environment.sessionVariables = {
   NIXOS_OZONE_WL = "1";
  };

}
