{ pkgs, ...}:
{
  imports = [
    ../common/waybar.nix
  ];
  home.file.".config/hypr/hyprpaper.conf".source = ../etc/hyprpaper.conf;
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once=${pkgs.hyprpaper}/bin/hyprpaper
    '';
    settings = {
      monitor = ",highres,auto,1";
      general = {
        gaps_out = 10;
      };
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
      workspace = [
        "1,monitor:eDP-1,persistent:true"
        "2,monitor:eDP-1,persistent:true"
        "3,monitor:eDP-1,persistent:true"
        "4,monitor:eDP-1,persistent:true"
        "5,monitor:eDP-1,persistent:true"
        "6,monitor:eDP-1,persistent:true"
        "7,monitor:eDP-1,persistent:true"
        "8,monitor:eDP-1,persistent:true"
      ];
      animation = [
        "windowsMove,0" # Don't animate moving windows - it's annoying
        "windowsIn,1,1,default" # Start window creation faster
        "workspaces,1,2,default"
      ];
      bind = [
        "$mainMod, Return, exec, kitty"
        "$secondMod, Return, exec, firefox"
        "$mainMod, Space, exec, rofi -show drun" #WOFI?
        "$mainMod, Q, killactive, "
        "SUPER + ALT, Q, exit, "
        "$mainMod, S, togglefloating"
        "$mainMod, F, fullscreen"
        "$secondMod, F, fakefullscreen"
        "$mainMod, T, togglesplit, # dwindle"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "CTRL + SHIFT, left, layoutmsg, preselect l" # not working...
        "CTRL + SHIFT, right, layoutmsg, preselect r"
        "CTRL + SHIFT, up, layoutmsg, preselect u"
        "CTRL + SHIFT, down, layoutmsg, preselect d"
      
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
      ]; 

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
