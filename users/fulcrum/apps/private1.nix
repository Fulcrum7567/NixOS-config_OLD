# HOME CONFIG

{ pkgs, ... }:
{
 imports = [
  ( import ./bin/discord.nix { inherit pkgs; } )
  ( import ./bin/git.nix { inherit pkgs; } )
  ( import ./bin/sublime.nix { inherit pkgs; } )
  ( import ./bin/chrome.nix { inherit pkgs; } )
  ( import ./bin/bitwarden.nix { inherit pkgs; } )
 ];
}
