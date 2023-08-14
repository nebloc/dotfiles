{ pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      # Me
      "super + Return" = "kitty";
      "super + shift + Return" = "firefox";
      "super + @space" = "rofi -show drun";

      "super + Escape" = "pkill -USR1 -x sxhkd";

      # BSPWM hotkeys
      "super + alt + {q,r}" = "bspc {quit,wm -r}";
      "super + q" = "bspc node -{c,k}";
      "super + m" = "bspc desktop -l next";
      "super + g" = "bspc node -s biggest.window";

      # State flags
      "super + {t,shift + t,s,f}" = "bspc node -t {\~tiled,\~pseudo-tiled,\~floating,\~fullscreen}";
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
    };
  };
}