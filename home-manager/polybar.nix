{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    script = ''
      polybar top &
    '';
    config = {
      "colors" = {
        background = "#0d161b";
        background-alt = "#cbc5c1";
        foreground = "#cbc5c1";
        foreground-alt = "#0d161b";
        primary = "#ffb52a";
        secondary = "#73999E";
        tertiary = "#BB7088";
        empty = "#8e8987";
        alert = "#bd2c40";
      };
      "bar/top" = {
        monitor = "Virtual-1";
        width = "100%";
        height = "30";
        fixed-center = false;
        radius = 0;
        modules-left = "bspwm";
        modules-center = "xwindow";
        modules-right = "cpu sep date";
        wm-restack = "bspwm";

        background = "\${colors.background}";
        foreground = "\${colors.foreground}";

        line-size = 3;
        line-border = 0;
        line-color = "#f00";
        border-size = 0;
        border-color = "#00000000";
        padding-left = 0;
        padding-right = 0;
        module-margin-left = 0;
        module-margin-right = 0;
        font-0 = "FiraCode Nerd Font:size=10;1";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d.%m.%y";
        time = "%H:%M";
        label = "%time%  %date%";
      };
      "module/bspwm" = {
        type = "internal/bspwm";
        pin-workspaces = true;
        label-focused = "%name%";
        label-separator = "|";
        label-margin-left = 0;

        label-focused-background = "\${colors.background}";
        label-focused-foreground = "\${colors.foreground}";
        label-focused-underline= "\${colors.primary}";
        label-focused-padding = 2;
        label-occupied = "%name%";
        label-occupied-padding = 2;
        label-urgent = "%name%!";
        label-urgent-background = "\${colors.alert}";
        label-urgent-padding = 2;
        label-empty = "%name%";
        label-empty-foreground = "\${colors.empty}";
        label-empty-padding = 2;
      };
      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:30:...%";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix-foreground = "\${colors.foreground-alt}";
        format-underline = "\${colors.secondary}";
        label = "﬙ %percentage:2%%";
      };
      "module/sep" = {
        type = "custom/text";
        content = "  ";
      };
    };
  };
}