{ pkgs, ... }:
{
 home.packages = with pkgs; [
  google-chrome
  vivaldi
  vivaldi-ffmpeg-codecs
 ];  

}