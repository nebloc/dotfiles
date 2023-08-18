{ config, pkgs, ... }:

{

  imports =
    [ 
      ./global
      ./common
      ./features/polybar.nix
    ];


  home.stateVersion = "23.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
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

    # work
    libreoffice
    obsidian

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
