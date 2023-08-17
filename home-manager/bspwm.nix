{ config, pkgs, ... }:

{
  xsession.windowManager.bspwm = {
    enable = true;
    startupPrograms = [
      "nitrogen --restore"
      "sxhkd"
      "polybar"
      "picom"
      "xsetroot -cursor_name left_ptr"
    ];
    monitors = {
      DP-2 = ["Main" "Mail" "Browse" "Code" "Games"];
      DP-3 = ["Admin" "Messages" "Reference" "Music" "Gaming"];
    };
    settings = {
      focus_follows_pointer = true;
    };
    extraConfigEarly = ''
      bspc wm --reorder-monitors DP-2 DP-3
    '';
  };
}
