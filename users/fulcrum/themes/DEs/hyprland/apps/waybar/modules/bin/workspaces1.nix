{ ... }:
{
 programs.waybar.settings.mainBar = {
  "hyprland/workspaces" = {
     active-only = false;
     all-outputs = true;
     format = "{name}";
     format-icons = {
              active = " 󱎴";
              default = "󰍹";
            };
  };
 };
}