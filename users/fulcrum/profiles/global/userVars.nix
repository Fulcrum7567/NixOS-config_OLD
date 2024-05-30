{ lib, ... }:
let
 userSettings = {
   username = "fulcrum";
   displayname = "Fulcrum";
   email = "dragon.fighter@outlook.de";
   configDir = "~/.myConfigs";
 };
in
{
 inherit userSettings;
}
