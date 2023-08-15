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
      Virtual-1 = ["Main" "Mail" "Browse" "Code" "Games"];
      #Virtual-2 = ["Admin" "Messages" "Reference" "Music" "Gaming"];
    };
    settings = {
      focus_follows_pointer = true;
    };
  };
}
