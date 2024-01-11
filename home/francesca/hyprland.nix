{ pkgs, ...}:
{
  imports = [
    ../common/waybar.nix
  ];
  home.file.".config/hypr/hyprpaper.conf".source = ../etc/hyprpaper.conf;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",highres,auto,1";
      decoration = {
        rounding = 2;
    
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      "$mainMod" = "SUPER";
      "$secondMod" = "SUPER + SHIFT";
      bind = [
        "$mainMod, Return, exec, kitty"
        "$secondMod, Return, exec, firefox"
        "$mainMod, Space, exec, rofi -show drun" #WOFI?
        "$mainMod, Q, killactive, "
        "SUPER + ALT, Q, exit, "
        "$mainMod, E, exec, dolphin"
        "$mainMod, S, togglefloating, "
        "$mainMod, R, exec, wofi --show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
      
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
      
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$secondMod, left, movewindow, l"
        "$secondMod, right, movewindow, r"
        "$secondMod, up, movewindow, u"
        "$secondMod, down, movewindow, d"
      ]; 

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
      extraConfig = ''
        exec-once=${pkgs.hyprpaper}/bin/hyprpaper
        exec-once=${pkgs.waybar}/bin/waybar
        '';
  };
}
