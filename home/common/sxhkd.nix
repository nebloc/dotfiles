{
  services.sxhkd = {
    enable = true;
    keybindings = {
      # Me
      "super + Return" = "kitty";
      "super + shift + Return" = "firefox";
      "super + @space" = "rofi -show drun";
      "super + shift + p" = "pavucontrol";

      "super + Escape" = "pkill -USR1 -x sxhkd";

      # BSPWM hotkeys
      "super + alt + {q,r}" = "bspc {quit,wm -r}";
      "super + q" = "bspc node -{c,k}";
      "super + m" = "bspc desktop -l next";
      "super + g" = "bspc node -s biggest.local";
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";

      # State flags
      "super + {t,shift + t,s,f}" = "bspc node -t {\\~tiled,\\~pseudo-tiled,\\~floating,\\~fullscreen}";
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

      # Focus / Swap
      "super + {_,shift + }{Left,Down,Up,Right}" =  "bspc node -{f,s} {west,south,north,east}";
      "super + {p,b,comma,period}" =                "bspc node -f @{parent,brother,first,second}";
      "super + {_,shift + }c" =                     "bspc node -f {next,prev}.local.!hidden.window";
      "super + bracket{left,right}" =               "bspc desktop -f {prev,next}.local";
      "super + {grave,Tab}" =                       "bspc {node,desktop} -f last";
      "super + {o,i}" = ''bspc wm -h off; bspc node {older,newer} -f; bspc wm -h on'';

      "super + {_,shift + }{1-9,0}" =               "bspc {desktop -f,node -d} '^{1-9,10}'";

      # Preselect
      "super + ctrl + {Left,Down,Up,Right}" =       "bspc node -p {west,south,north,east}";
      "super + ctrl + {1-9}" =                      "bspc node -o 0.{1-9}";
      "super + ctrl + space" =                      "bspc node -p cancel";
      "super + ctrl + shift + space" =              "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      # Move / Resize
      "super + alt + {h,j,k,l}" =                   "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
      "super + alt + shift + {h,j,k,l}" =           "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
      # TODO: Clashing with move operation above... Need to work out why
      #"super + {Left,Down,Up,Right}" =              "bspc node -v {-20 0,0 20,0 -20,20 0}";
      # Brightness
      "XF86MonBrightness{Down,Up}" =                "light {-U 5,-A 5}";
      # Sound
      "XF86Audio{LowerVolume,RaiseVolume}" =        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%{-,+}";
      "XF86AudioMute" =                             "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "super + h" =                                 "bspc node --flag hidden=on";
      "super + shift + h" =                         ''
        nodes=( $(bspc query -N -n .hidden) ) && s=$(xtitle ''${nodes[@]} | rofi -show -dmenu -format i) && [[ -n "$s" ]] && bspc node "''${nodes[$s]}" -n focused -g hidden=off -f
        '';
    };
  };
}
