{ pkgs, ... }:

{

  imports =
    [ 
      ./hyprland.nix
      ./ghostty.nix
      ../common
    ];


  home.stateVersion = "23.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    asciiquarium
    thunderbird
    zsh
    boxes
    chromium
    nitrogen
    pavucontrol
    neofetch 
    killall
    picom
    tree
    tldr
    blender
    freecad
    signal-desktop


    # work
    libreoffice
    obsidian
    slack

    # dev
    go
    git
    vscode
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })

    # media
    cava
    discord
    cider
    calibre
    vlc
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  programs.thunderbird = {
    enable = true;
    settings = {
      "mailnews.default_news_sort_order" = 2;
      "mailnews.default_sort_order" = 2;
      "mailnews.default_sort_type" = 22;
    };
    profiles."main" = {
      isDefault = true;
      settings = {
        "mailnews.default_news_sort_order" = 2;
        "mailnews.default_sort_order" = 2;
        "mailnews.default_sort_type" = 22;
      };
    };
  };

  #  ------   -----------
  # | DP   | |  DP 2     |
  # |  3   | |           |
  # |      |  -----------
  #  ------
  # TODO: Add monitor config
}
