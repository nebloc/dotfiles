{
  xsession.windowManager.bspwm = {
    enable = true;
    startupPrograms = [
      "nitrogen --restore"
      "sxhkd"
      "sleep 1;polybar main" # TODO make this a systemd target fix
      "xsetroot -cursor_name left_ptr"
    ];
    monitors = {
      DP-1 = ["Main" "Mail" "Browse" "Code" "Games"];
      DP-2 = ["Admin" "Messages" "Reference" "Music" "Gaming"];
      eDP-1 = ["Main" "Mail" "Browse" "Code" "Reference" "Admin" "Messages" "Music" ];
    };
    settings = {
      focus_follows_pointer = true;
    };
    extraConfigEarly = ''
      killall polybar
      bspc wm --reorder-monitors DP-1 DP-2
    '';
    # Get class name from $ xprop WM_CLASS
    rules = {
      "thunderbird" = {
        desktop = "Mail";
      };
      "steam" = {
        desktop = "Gaming";
      };
      "discord" = {
        desktop = "Gaming";
      };
      "Pavucontrol" = {
        state = "floating";
      };
      ".protonvpn-wrapped" = {
        state = "floating";
      };
      "Cider" = {
        desktop = "Music";
      };
      "Bitwarden" = {
        state = "floating";
      };
      ".protonvpn-app-wrapped" = {
        state = "floating";
      };
    };
  };
}
