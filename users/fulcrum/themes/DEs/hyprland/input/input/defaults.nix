{ ... }:
{
  wayland.windowManager.hyprland.settings = {
   #############
   ### INPUT ###
   #############

   # https://wiki.hyprland.org/Configuring/Variables/#input
   input = {
    kb_layout = "de";
    kb_variant = "";
    kb_model = "";
    kb_options = "";
    kb_rules = "";
    
    follow_mouse = 0;

    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

    touchpad = {
        natural_scroll = true;
    };
   };
  };
  
}
