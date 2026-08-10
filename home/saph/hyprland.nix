{ pkgs, ... }:
{
  imports = [
    ../common/waybar.nix
  ];
  home.file.".config/hypr/hyprpaper.conf".source = ./etc/hyprpaper.conf;
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraConfig = # Lua
      ''
        hl.bind(mod .. "Space", hl.dsp.exec_cmd("${pkgs.rofi}/bin/rofi -show drun"))
        hl.bind(mod .. "Return", hl.dsp.exec_cmd("${pkgs.ghostty}/bin/ghostty"))
        hl.bind(mod .. "SHIFT + Return", hl.dsp.exec_cmd("${pkgs.firefox}/bin/firefox"))

        hl.bind(mod .. "Q", hl.dsp.window.close())
        hl.bind(mod .. "ALT + Q", hl.dsp.exit())
        hl.bind(mod .. "S", hl.dsp.window.float({action = "toggle"}))
        hl.bind(mod .. "F", hl.dsp.window.fullscreen({action = "toggle"}))
        hl.bind(mod .. "SHIFT + F", hl.dsp.window.fullscreen_state({internal = 0, client = 3}))
        hl.bind(mod .. "H", hl.dsp.workspace.toggle_special())

        hl.bind(mod .. "SHIFT + left", hl.dsp.window.swap({direction = "left"}))
        hl.bind(mod .. "SHIFT + right", hl.dsp.window.swap({direction = "right"}))
        hl.bind(mod .. "SHIFT + up", hl.dsp.window.swap({direction = "up"}))
        hl.bind(mod .. "SHIFT + down", hl.dsp.window.swap({direction = "down"}))

        hl.bind(mod .. "left",  hl.dsp.focus({direction = "left"}))
        hl.bind(mod .. "right", hl.dsp.focus({direction = "right"}))
        hl.bind(mod .. "up",    hl.dsp.focus({direction = "up"}))
        hl.bind(mod .. "down",  hl.dsp.focus({direction = "down"}))

        for i = 1, 10, 1 do
          hl.bind(mod .. (i % 10),  hl.dsp.focus({workspace = i}))
        end

        for i = 1, 10, 1 do
          hl.bind(mod .. "SHIFT + ".. (i % 10),  hl.dsp.window.move({workspace = i, follow = false}))
        end

        hl.bind(mod .. "mouse:272", hl.dsp.window.drag())
        hl.bind(mod .. "mouse:273", hl.dsp.window.resize())


        hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 1%+"), {repeating = true})
        hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 1%-"), {repeating = true})
        hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

        hl.window_rule({
          name = "Bitwarden",
          match = {
            title = "^Bitwarden$"
          },
          workspace = "special"
        })

        hl.window_rule({
          name = "Proton VPN",
          match = {
            title = "^Proton VPN$"
          },
          workspace = "special",
          size = {800, 600}
        })

        -- "SUPER + ALT, left, layoutmsg, preselect l"
        -- "SUPER + ALT, right, layoutmsg, preselect r"
        -- "SUPER + ALT, up, layoutmsg, preselect u"
        -- "SUPER + ALT, down, layoutmsg, preselect d"

        hl.on("hyprland.start", (function()
          hl.exec_cmd("${pkgs.hyprpaper}/bin/hyprpaper")
          hl.exec_cmd("${pkgs.bitwarden-desktop}/bin/bitwarden")
          hl.exec_cmd("${pkgs.proton-vpn}/bin/protonvpn-app")
          hl.exec_cmd("${pkgs.wlsunset}/bin/wlsunset -l 51.5 -L -0.1")
        end))

        hl.curve("quick", { type = "bezier", points = {{0.15, 0}, {0.1, 1}}})
        hl.animation({
          leaf = "windowsMove",
          enabled = false
        })
        hl.animation({
          leaf = "windowsIn",
          enabled = true,
          speed = 1,
          bezier = "quick"
        })
        hl.animation({
          leaf = "workspaces",
          enabled = true,
          speed = 1,
          bezier = "quick"
        })
      '';
    settings = {
      mod = {
        _var = "SUPER + ";
      };
      config = {
        general = {
          gaps_out = 10;
          layout = "dwindle";
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
        dwindle = {
          preserve_split = true;
          pseudotile = true;
        };
      };
      #  ------   -----------
      # | DP-2 | |  DP-1     |
      # |      | |           |
      # |      |  -----------
      #  ------
      monitor = [
        {
          output = "DP-1";
          mode = "highres";
          position = "auto";
          scale = 1;
        }
        {
          output = "DP-2";
          mode = "highres";
          position = "auto-left";
          scale = 1;
          transform = 1; # Rotated 90 degrees (portrait)
        }
      ];
    };
  };
}
