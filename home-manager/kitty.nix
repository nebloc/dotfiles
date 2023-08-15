{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
        name = "FiraCode Nerd Font";
    };
    settings = {
      foreground   = "#e5dfe8";
      background   = "#1e181a";
      cursor       = "#e5dfe8";
      color0       = "#1e181a";
      color8       = "#a09ca2";
      color1       = "#E659D2";
      color9       = "#E659D2";
      color2       = "#A394A3";
      color10      = "#A394A3";
      color3       = "#D5A7B5";
      color11      = "#D5A7B5";
      color4       = "#B2A4D6";
      color12      = "#B2A4D6";
      color5       = "#D0B0DE";
      color13      = "#D0B0DE";
      color6       = "#D4CFEA";
      color14      = "#D4CFEA";
      color7       = "#e5dfe8";
      color15      = "#e5dfe8";
    };
  };
}