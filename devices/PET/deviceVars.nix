{ ... }:
let
 systemSettings = {
    system = "x86_64-linux"; # system arch
   };
   
in
{
 inherit systemSettings;
}
