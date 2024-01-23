{
  xsession.windowManager.bspwm = {
    enable = true;
    startupPrograms = [
      "nitrogen --restore"
      "sxhkd"
      "polybar main"
      "xsetroot -cursor_name left_ptr"
    ];
    monitors = {
      eDP-1 = [ "Main" "Mail" "Browse" "Code" "Reference" "Admin" "Messages" "Music"]; # Francesca screen 1
      DP-4 = [ "Extra" "Misc" ]; # Francesca screen 2
    };
    settings = {
      focus_follows_pointer = true;
    };
    extraConfigEarly = ''
      killall polybar
      
      my_laptop_external_monitor=$(xrandr --query | grep 'DP-4')
      if [[ $my_laptop_external_monitor = *connected* ]]; then
        xrandr --output eDP-1 --primary --output DP-4 --mode 2560x1440 --rotate normal --above eDP-1
        bspc wm --reorder-monitors eDP-1 DP-4
      fi
    '';
    extraConfig = ''
      if [[ $my_laptop_external_monitor = *connected* ]]; then
        polybar second &
      fi
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
