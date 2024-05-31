{ ... }:

{

 # use dconf watch /
 dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
     };
     
     "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
     };
  };
  

}
