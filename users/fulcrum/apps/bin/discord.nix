# HOME CONFIG

{ pkgs, ... }:

{
 home.packages = with pkgs; [
  discord
  betterdiscordctl
  moonlight-qt
 ];
}
