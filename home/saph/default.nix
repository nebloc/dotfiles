{ config, pkgs, ... }:

{

  imports =
    [ 
      ./global
      ./common
      ./saph/polybar.nix
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
    rofi
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

  #  ------   -----------
  # | DP   | |  DP 2     |
  # |  3   | |           |
  # |      |  -----------
  #  ------
  # TODO: Add monitor config
}
