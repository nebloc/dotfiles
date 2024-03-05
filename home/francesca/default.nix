{ config, pkgs, inputs, ... }:

{

  imports =
    [ 
      ../common
      ./polybar.nix
      ./bspwm.nix
    ];



  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    asciiquarium
    thunderbird
    zsh
    boxes
    chromium
    nitrogen
    rofi
    pavucontrol
    neofetch 
    killall
    tree
    tldr
    freecad
    gnome.seahorse

    # social
    signal-desktop
    element-desktop
    discord

    # work
    libreoffice
    obsidian
    blanket
    unstable.citrix_workspace

    # dev
    gcc
    git
    vscode
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    azuredatastudio_local
    zeal
    kubectl
    dotnet-sdk_8
    jetbrains.idea-community
    # Scala
    metals
    coursier
    sbt
    scala_3
    # Rust
    rustc
    cargo
    # Python
    python3
    # Golang
    go

    # media
    cava
    cider
    calibre
    vlc
    gnome.cheese
  ];

  services.nextcloud-client = {
      enable = true;
      startInBackground = true;
  };

  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    };
    shellAliases = {
      k = "kubectl";
    };
  };
  #   -----------
  #  |   eDP-1   |
  #  |           |
  #   -----------
  #
  # TODO: Add monitor config
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
