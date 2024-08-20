{ config, pkgs, ... }:

{
 home.packages = [ pkgs.git ];
 programs.git.enable = true;
 programs.git.userName = "Fulcrum7567";
 programs.git.userEmail = "dragon.fighter@outlook.de";
}
