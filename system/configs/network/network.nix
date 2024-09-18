# SYSTEM CONFIG

{ currentDevice, ... }:
{
 networking.hostName = currentDevice; # Define your hostname.
 
 # Enable networking
  networking.networkmanager.enable = true;
}
