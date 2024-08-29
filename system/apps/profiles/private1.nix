{ pkgs, ... }:

{
 imports = [
  ( import ../groups/gaming.nix { inherit pkgs; } )
 ];
}
