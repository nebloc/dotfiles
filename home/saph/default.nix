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
    thunderbird
    zsh
    boxes
    chromium
    pavucontrol
    blender
    freecad
    signal-desktop
    wlsunset # Nightshift

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

    # terminal tools
    feh
    tree
    yazi
    tldr
    asciiquarium
    ripgrep
    fastfetch
    killall
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
