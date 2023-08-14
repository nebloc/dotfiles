{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    script = ''
      polybar top &
    '';
    config = {
      "bar/top" = {
        monitor = "Virtual-1";
        width = "100%";
        height = "3%";
        radius = 0;
        modules-left = "bspwm";
        modules-center = "xwindow";
        modules-right = "date";
        wm-restack = "bspwm";
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
      };
      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:30:...%";
      };
    };
  };
}