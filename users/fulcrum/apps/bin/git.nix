{ pkgs, ... }:
{
  
  home.packages = with pkgs; [
  git
  jetbrains.idea-ultimate
  # jdk
  xorg.libX11
  xorg.libXext
  #openjfx
 ];
}
