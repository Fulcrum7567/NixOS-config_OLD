# defines what device you're on
# MUST NOT BE SYNCED!

{ ... }:
let
 currentDevice = "PET"; # Select, what device you're using rn. (A folder must exist with this name)
in
{
 inherit currentDevice;
}
