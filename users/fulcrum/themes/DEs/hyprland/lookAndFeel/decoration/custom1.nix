{ ... }:
{
  wayland.windowManager.hyprland.settings = {
   # https://wiki.hyprland.org/Configuring/Variables/#decoration
   decoration = {
    rounding = 10;

    # Change transparency of focused and unfocused windows
    active_opacity = 1.0;
    inactive_opacity = 0.5;

    drop_shadow = true;
    shadow_range = 4;
    shadow_render_power = 3;
    "col.shadow" = "rgba(1a1a1aee)";

    # https://wiki.hyprland.org/Configuring/Variables/#blur
    blur = {
        enabled = true;
        size = 6;
        passes = 3;
	new_optimizations = "on";
	ignore_opacity = "on";
        
        vibrancy = 0.1696;
    };
   };
  };
}
