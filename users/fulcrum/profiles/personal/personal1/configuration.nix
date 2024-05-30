{ ... }:
let

 activeWM = "gnome";

in
{
 imports = [
  ../global/configuration.nix
  (./. + "../../../../wm/" + ("/"+(activeWM)) + "/configuration.nix")
 ];
}
