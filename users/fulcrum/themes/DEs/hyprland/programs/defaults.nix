{ ... }:
{
  wayland.windowManager.hyprland.settings = {
   ###################
   ### MY PROGRAMS ###
   ###################

   # See https://wiki.hyprland.org/Configuring/Keywords/

   # Set programs that you use
   "$terminal" = "kitty";
   "$fileManager" = "dolphin";
   "$menu" = "rofi --show drun";
  };
}
