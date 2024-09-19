# HOME CONFIG

{ pkgs, ... }:
{
 imports = [
  ( import ./bin/discord/discord.nix { inherit pkgs; } )
  ( import ./bin/git/git.nix { inherit pkgs; } )
 ];
}
