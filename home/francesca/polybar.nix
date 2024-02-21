{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      pulseSupport = true;
    };
    script = ''
      killall -q polybar
      polybar main &
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
      "bar/second" = {
        monitor = "DP-4";
        width = "100%";
        height = "30";
        fixed-center = false;
        radius = 0;
        modules-left = "launcher bspwm";
        modules-center = "xwindow";
        modules-right = "battery sep pulseaudio sep date";
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
      "bar/main" = {
        monitor = "eDP-1";
        width = "100%";
        height = "30";
        fixed-center = false;
        radius = 0;
        modules-left = "launcher bspwm";
        modules-center = "xwindow";
        modules-right = "battery sep pulseaudio sep memory sep cpu sep date sep powermenu";
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
        label = "%percentage:2%%";
      };
      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix-foreground = "\${colors.foreground-alt}";
        format-underline = "#4bffdc";
        label = "%gb_used%";
      };
      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        format-volume = "<label-volume> <bar-volume>";
        label-volume = " %percentage%%";
        label-volume-foreground = "\${root.foreground}";

        label-muted = " ﱝ muted";
        label-muted-foreground = "#666";

        reverse-scroll = true;

        bar-volume-width = 10;
        bar-volume-foreground-0 = "#55aa55";
        bar-volume-foreground-1 = "#55aa55";
        bar-volume-foreground-2 = "#55aa55";
        bar-volume-foreground-3 = "#55aa55";
        bar-volume-foreground-4 = "#55aa55";
        bar-volume-foreground-5 = "#f5a70a";
        bar-volume-foreground-6 = "#ff5555";
        bar-volume-gradient = false;
        bar-volume-indicator = "|";
        bar-volume-indicator-font = 2;
        bar-volume-fill = "─";
        bar-volume-fill-font = 2;
        bar-volume-empty = "─";
        bar-volume-empty-font = 2;
        bar-volume-empty-foreground = "\${colors.foreground-alt}";
      };
      "module/powermenu" = {
        type = "custom/menu";
        expand-right = "true";
        menu-0-0 = "\" Reboot |\"";
        menu-0-0-exec = "\"menu-open-1\"";
        menu-0-1 = "\" Shutdown \"";
        menu-0-1-exec = "\"menu-open-2\"";

        menu-1-0 = "\" Back |\"";
        menu-1-0-exec = "menu-open-0";
        menu-1-1 = "\" Reboot \"";
        menu-1-1-exec = "systemctl reboot";

        menu-2-0 = "\" Shutdown |\"";
        menu-2-0-exec = "systemctl poweroff";
        menu-2-1 = "\" Back \"";
        menu-2-1-exec = "menu-open-0";
        format = "<label-toggle><menu>";
        label-open = "¶";
        label-open-foreground = "\${colors.foreground}";
        label-open-background = "\${colors.alert}";
        label-open-padding = "1";
        label-close = "EXIT";
        label-close-foreground = "\${colors.secondary}";
        label-close-padding = "1";
      };
      "module/launcher" = {
        type = "custom/text";
        content = "#!";
        content-foreground = "\${colors.foreground-alt}";
        content-background = "\${colors.secondary}";
        click-left = "exec rofi -show drun";
        click-middle = "exec rofi -show drun";
        click-right = "exec rofi -show drun";
        content-padding = 1;
      };
      "module/battery"  = {
        type = "internal/battery";
        full-at = 90;
        low-at = 20;
        battery = "BAT1";
        adaptor = "ACAD";
        poll-interval = 5;

        label-charging = "󰂄 %percentage%%";
        label-discharging = "󰁿 %percentage%%";
        label-low = "󰁿 %percentage%";
      };
      "module/sep" = {
        type = "custom/text";
        content = "  ";
      };
    };
  };
}
