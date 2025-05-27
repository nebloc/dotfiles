{...}:{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    enableFishIntegration = true;
    settings = {
      term= "xterm-256color";
      font-size= 11.0;
      font-family= "FiraCode Nerd Font";
      theme = "personal";
    };
    themes = {
      personal = {
        background = "0d161b";
        foreground = "cbc5c1";
        cursor-color = "cbc5c1"; # Fallback to foreground
        selection-background = "aaaaaa";
        selection-foreground = "525252";
        palette = [
          "0=0d161b"
          "8=8e8987"
          "1=C1A135"
          "9=C1A135"
          "2=E5CA16"
          "10=E5CA16"
          "3=AE9E67"
          "11=AE9E67"
          "4=CDA55E"
          "12=CDA55E"
          "5=BB7088"
          "13=BB7088"
          "6=73999E"
          "14=73999E"
          "7=cbc5c1"
          "15=cbc5c1"
        ];
      };
    };
  };
}
