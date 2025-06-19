{...}:{
  programs.yazi = {
    enable = true;
    settings = {
      open = {
        rules = [
          {
            mime = "video/**";
            use ="video";
          }
          {
            mime = "image/**";
            use ="image";
          }
        ];
      };
      opener = {
        image = [
          {
            run = ''feh -. $@'';
            orphan = true;
            display_name = "Open";
          }
        ];
        video = [
          {
            run = ''vlc "$@"'';
            orphan = true;
            display_name = "vlc";
          }
        ];
      };
    };
  };
}
