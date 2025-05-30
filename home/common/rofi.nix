{pkgs, ...}:
{
  home.file = {
    ".config/rofi/theme.rasi".source = ../etc/rofi_theme.rasi;
    # '';
  };
  programs.rofi = {
    enable = true;
    location = "top-left";
    extraConfig = {
        modi = "combi,drun,run";
        width = 20;
        padding = 0;
    };
    theme = "./theme.rasi";
    package = pkgs.rofi-wayland;
  };
}
