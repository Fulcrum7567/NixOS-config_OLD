{ pkgs, ... }:
{
 home.packages = with pkgs; [
  sublime4
  obsidian
 ];

 nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1w"
                "electron-25.9.0"
              ];


}
