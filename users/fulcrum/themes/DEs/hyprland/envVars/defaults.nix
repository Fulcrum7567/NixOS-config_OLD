{ ... }:
{
  wayland.windowManager.hyprland.settings = {
   #############################
   ### ENVIRONMENT VARIABLES ###
   #############################

   # See https://wiki.hyprland.org/Configuring/Environment-variables/
   
   env = [
    "XCURSOR_SIZE,25"
    "HYPRCURSOR_SIZE,25"
   ];
  };
}
