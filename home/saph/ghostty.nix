{...}:{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    enableFishIntegration = true;
    settings = {
      term= "xterm-256color";
      font-size= 11.0;
      font-family= "FiraCode Nerd Font";
      theme = "kanagawa-lotus";
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
      kanagawa-wave = {
        background = "1f1f28";
        foreground = "dcd7ba";
        cursor-color = "c8c093";
        selection-background = "2d4f67";
        selection-foreground = "c8c093";
        palette = [
          "0=#16161d"
          "1=#c34043"
          "2=#76946a"
          "3=#c0a36e"
          "4=#7e9cd8"
          "5=#957fb8"
          "6=#6a9589"
          "7=#c8c093"
          "8=#727169"
          "9=#e82424"
          "10=#98bb6c"
          "11=#e6c384"
          "12=#7fb4ca"
          "13=#938aa9"
          "14=#7aa89f"
          "15=#dcd7ba"
        ];
      };
      kanagawa-lotus = {
        background = "f2ecbc";
        foreground = "545464";
        cursor-color = "43436c";
        selection-background = "c9cbd1";
        selection-foreground = "43436c";
        palette = [
          "0=#1f1f28"
          "1=#c84053"
          "2=#6f894e"
          "3=#77713f"
          "4=#4d699b"
          "5=#b35b79"
          "6=#597b75"
          "7=#545464"
          "8=#8a8980"
          "9=#d7474b"
          "10=#6e915f"
          "11=#836f4a"
          "12=#6693bf"
          "13=#624c83"
          "14=#5e857a"
          "15=#43436c"
        ];
      };
    };
  };
}
