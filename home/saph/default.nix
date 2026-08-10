{ pkgs, ... }:

{

  imports = [
    ./hyprland.nix
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
    unstable.obsidian
    slack

    # dev
    direnv
    go
    git
    vscode

    # media
    unstable.cava
    discord
    cider-2
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
    zellij

    # own tools
    nfi
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
  # | DP-2 | |  DP-1     |
  # |      | |           |
  # |      |  -----------
  #  ------
  programs.mangohud = {
    enable = true;
  };
}
