{ pkgs, ... }:

{
 imports = [ 
  ( import ../bin/discord/discord.nix { inherit pkgs; } )
 ];
}