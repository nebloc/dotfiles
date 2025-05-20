{ pkgs, ... }:
{
  imports = [
    ../common/waybar.nix
  ];
  home.file.".config/hypr/hyprpaper.conf".source = ../etc/hyprpaper.conf;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "eDP-1,highres,auto-down,1"
        ",2560x1440,auto-up,1"
      ];
      general = {
        gaps_out = 10;
        layout = "dwindle";
      };
      dwindle = {
        preserve_split = true;
        pseudotile = true;
      };
      decoration = {
        rounding = 2;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

      };
      "$mainMod" = "SUPER";
      "$secondMod" = "SUPER + SHIFT";
      animation = [
        "windowsMove,0" # Don't animate moving windows - it's annoying
        "windowsIn,1,1,default" # Start window creation faster
        "workspaces,1,2,default"
      ];
      bind = [
        "$mainMod, Return, exec, ${pkgs.kitty}/bin/kitty"
        "$secondMod, Return, exec, ${pkgs.firefox}/bin/firefox"
        "$mainMod, Space, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun" # WOFI?
        "$mainMod, Q, killactive, "
        "SUPER + ALT, Q, exit, "
        "$mainMod, S, togglefloating"
        "$mainMod, F, fullscreen"
        "$secondMod, F, fullscreenstate, 0 3"
        "$mainMod, T, togglesplit" # dwindle

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "SUPER + ALT, left, layoutmsg, preselect l"
        "SUPER + ALT, right, layoutmsg, preselect r"
        "SUPER + ALT, up, layoutmsg, preselect u"
        "SUPER + ALT, down, layoutmsg, preselect d"
        "$mainMod, H, togglespecialworkspace"
        "$secondMod, H, movetoworkspacesilent, special"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        "$secondMod, left, movewindow, l"
        "$secondMod, right, movewindow, r"
        "$secondMod, up, movewindow, u"
        "$secondMod, down, movewindow, d"

        ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 1%+"
        ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 1%-"
        ", XF86MonBrightnessUp,exec,${pkgs.brightnessctl}/bin/brightnessctl set +5%"
        ", XF86MonBrightnessDown,exec,${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
      ];
      bindl = [
        # trigger when the switch is toggled
        ", switch:Lid Switch, exec, swaylock"
        # trigger when the switch is turning on
        ", switch:on:Lid Switch, exec, hyprctl keyword monitor \"eDP-1, disable\""
        # trigger when the switch is turning off
        ", switch:off:Lid Switch, exec, hyprctl keyword monitor \"eDP-1,highres,auto,1\""
      ];

      windowrulev2 = [
        "workspace special, title:^Bitwarden$"
        "workspace special, title:^Proton VPN$"
        "size 800 600, title:^Proton VPN$"
      ];
      exec-once = [
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.bitwarden}/bin/bitwarden"
        "${pkgs.protonvpn-gui}/bin/protonvpn-app"
        "${pkgs.wlsunset}/bin/wlsunset -l 51.5 -L -0.1"
      ];
    };
  };
}
