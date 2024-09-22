{ pkgs, ... }:
{
 programs.waybar = {
  "backlight" = {
     device = "intel_backlight";
     format = "{percent}% {icon}";
     format-icons = ["" ""];
  };
 };
}