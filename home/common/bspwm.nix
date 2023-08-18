{
  xsession.windowManager.bspwm = {
    enable = true;
    startupPrograms = [
      "nitrogen --restore"
      "sxhkd"
      "polybar main"
      "polybar second"
      "picom"
      "xsetroot -cursor_name left_ptr"
      "thunderbird"
    ];
    monitors = {
      DP-2 = ["Main" "Mail" "Browse" "Code" "Games"];
      DP-3 = ["Admin" "Messages" "Reference" "Music" "Gaming"];
    };
    settings = {
      focus_follows_pointer = true;
    };
    extraConfigEarly = ''
      killall polybar
      bspc wm --reorder-monitors DP-2 DP-3
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
      "Cider" = {
        desktop = "Music";
      };
    };
  };
}