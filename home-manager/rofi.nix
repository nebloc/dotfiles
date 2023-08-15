{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    location = "top-left";
    extraConfig = {
        modi = "combi,drun,run";
        width = 20;
        padding = 0;
    };
    theme = "./theme.rasi";
  };
}