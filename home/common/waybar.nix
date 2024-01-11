{
  programs.waybar = {
    enable = true;
    style = ''
    /* Gruvbox Palette */
    @define-color foreground #ebdbb2;
    @define-color background #1d2021;
    @define-color alt_background #282828;
    @define-color accent #689d6a;

    @define-color black #282828;
    @define-color red #cc241d;
    @define-color green #98971a;
    @define-color blue #7daea3;
    @define-color yellow #d79921;
    @define-color magenta #b16286;
    @define-color cyan #689d6a;
    @define-color white #a89984;

    @define-color alt_black #3c3836;
    @define-color alt_red #fb4934;
    @define-color alt_green #b8bb26;
    @define-color alt_blue #7daea3;
    @define-color alt_yellow #fabd2f;
    @define-color alt_magenta #d3869b;
    @define-color alt_cyan #8ec07c;
    @define-color alt_white #ebdbb2;

    * {
    
      border: none;
      font-family: FiraCode Nerd Font;
      font-size: 14px;
    }

    window#waybar {
      /* background-color: rgba(18, 21, 29, 0.98); */
      background-color: @background;
      /* background-color: rgba(0, 0, 0, 0); */
      border-radius: 0px;
      color: @foreground;
      opacity: 1;
      transition-property: background-color;
      transition-duration: .5s;
      margin-bottom: -7px;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    window#hyprland-window {
      background-color: @background;
    }

    #workspaces,
    #mode,
    #window,
    #cpu,
    #memory,
    #temperature,
    #custom-media,
    #custom-powermenu,
    #custom-fans,
    #custom-wmname,
    #clock,
    #idle_inhibitor,
    #language,
    #pulseaudio,
    #backlight,
    #battery,
    #network,
    #tray {
      background-color: @alt_background;
      padding: 0 10px;
      margin: 5px 2px 5px 2px;
      border: 1px solid rgba(0, 0, 0, 0);
      border-radius: 6px;
      background-clip: padding-box;
    }

    #workspaces button {
      background-color: @alt_background;
      padding: 0 5px;
      min-width: 20px;
      color: @foreground;
    }

    #workspaces button:hover {
      background-color: rgba(0, 0, 0, 0)
    }

    #workspaces button.active {
      color: @accent;
    }

    #workspaces button.urgent {
      color: @red;
    }

    #cpu {
      padding: 0 10px;
      color: @alt_cyan;
    }

    #memory {
      padding: 0 10px;
      color: @alt_cyan;
    }

    #temperature {
      padding: 0 10px;
      color: @blue;
    }

    #temperature.critical {
      background-color: @red;
      padding: 0 10px;
      color: @background;
    }

    #custom-media {
      color: #c678dd;
      padding: 0 10px;
      color: @background;
    }

    #custom-fans {
      padding: 0 10px;
      color: @blue;
    }

    #clock {
      padding: 0 10px;
      color: @blue;
    }

    #idle_inhibitor {
      padding: 0 10px;
      color: @foreground;
    }

    #language {
      padding: 0 10px;
      color: @blue;
    }

    #pulseaudio {
      padding: 0 10px;
      color: @yellow;
    }

    #pulseaudio.muted {
      padding: 0 10px;
      background-color: @red;
      color: @background;
    }

    #backlight {
      padding: 0 10px;
      color: @yellow;
    }

    #battery {
      padding: 0 10px;
      color: @alt_green;
    }

    #battery.charging,
    #battery.plugged {
      padding: 0 10px;
      background-color: @alt_green;
      color: @background;
    }

    @keyframes blink {
      to {
        background-color: @background;
        color: @red;
      }
    }

    #battery.critical:not(.charging) {
      padding: 0 10px;
      background-color: @red;
      color: @background;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #network {
      padding: 0 10px;
      color: @blue;
    }

    #custom-wmname {
      color: @accent;
      background-color: @background;
      font-size: 25px;
      margin: 1px;
      padding: 0px 0px 0px 5px;
    }

    #network.disconnected {
      padding: 0 10px;
      background-color: @red;
      color: @background;
    }

    #custom-powermenu {
      background-color: @red;
      color: @background;
      font-size: 15px;
      padding-right: 6px;
      padding-left: 11px;
      margin: 5px;
    }
    '';
    settings = {
      mainBar = {
        margin = "0px 0px 0px 0px";
        layer = "top";
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["battery" "cpu" "memory" "pulseaudio" "tray" "clock"];
      };
      "hyprland/workspaces" = {
        active-only = "false";
        on-click = "activate";
      };
      "battery" = {
        states = {
          warning = "30";
          critical = "15";
        };
         format = "{icon}{capacity}%";
         tooltip-format = "{timeTo} {capacity}%";
         format-charging = "󰂄{capacity}%";
         format-plugged = " ";
         format-alt = "{time} {icon}";
         format-icons = ["󰁺  " "󰁼  " "󰁾  " "󰂀  " "󰂂  "];
      };
    };
  };
}
